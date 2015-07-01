package ucar.board.review.model;

import java.io.File;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ucar.board.reviewcomment.model.ReviewCommentVO;
import ucar.member.model.MemberVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Resource
	private ReviewDAO reviewDAO;
	@Resource(name="uploadPath")
	private String path;
	@Resource(name="viewPath")
	private String viewPath;
	
	@Transactional
	@Override
	public void writeReviewSavingPoint(ReviewVO vo) {
		reviewDAO.writeReview(vo);
		registerFile(vo);
	}
	@Transactional
	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
		registerFile(vo);
	}
	@Transactional
	@Override
	public void deleteReview(int reviewNo) {
		reviewDAO.deleteReview(reviewNo);
		reviewDAO.deleteFileByReviewNo(reviewNo);
	}

	@Override
	public ListVO getReviewList(String pageNo) {
		if (pageNo == null || pageNo == "")
			pageNo = "1";
		List<ReviewVO> list = reviewDAO.getReviewList(pageNo);
		for(int i=0; i<list.size(); i++){
			list.get(i).setReviewCommentCount(reviewDAO.countReviewCommentByReviewNo(list.get(i).getReviewNo()));
			list.get(i).setReviewLikeCount(reviewDAO.countReviewLikeByReviewNo(list.get(i).getReviewNo()));
		}
		int total = reviewDAO.totalContent();
		PagingBean paging = new PagingBean(total, Integer.parseInt(pageNo));
		ListVO lvo = new ListVO(list, paging);
		System.out.println(lvo+"service test");
		return lvo;
	}

	@Override
	public ReviewVO showContent(int no) {
		reviewDAO.updateCount(no);
		return reviewDAO.showContent(no);
	}

	@Override
	public ReviewVO showContentNoHit(int no) {
		return reviewDAO.showContent(no);
	}

	@Override
	public List<ReviewCommentVO> getCommentListByReviewNo(int reviewNo) {
		return reviewDAO.getCommentListByReviewNo(reviewNo);
	}

	@Override
	public HashMap<String, String> likeReview(ReviewVO reviewVO) {
		HashMap<String, String> map=new HashMap<String, String>();
		if(reviewDAO.findReviewLikeMemberByMemberId(reviewVO)!=null){
			map.put("flag", "fail");
		} else{
			reviewDAO.insertReviewLike(reviewVO);
			map.put("flag", "ok");
			map.put("likeCount", reviewDAO.findReviewLikeCountByReviewNo(reviewVO.getReviewNo()));
		}
		return map;
	}

	@Override
	public HashMap<String, String> likeReviewCancel(ReviewVO reviewVO) {
		HashMap<String, String> map=new HashMap<String, String>();
		reviewDAO.deleteReviewLike(reviewVO);
		map.put("flag", "ok");
		map.put("likeCount", reviewDAO.findReviewLikeCountByReviewNo(reviewVO.getReviewNo()));
		return map;
	}
	
	@Override
	public HashMap<String, String> fileNameFomat(MemberVO memberVO, String oriName) throws Exception{
		HashMap<String, String> map=new HashMap<String, String>();
		oriName = URLDecoder.decode(oriName, "UTF-8");	
		String destPath = path + memberVO.getMemberId() + "\\";
		File file = new File(destPath);
		if (!file.exists()) {
			file.mkdirs();
		}
		String fileName = memberVO.getMemberId()+"_"+System.currentTimeMillis() + oriName.substring(oriName.lastIndexOf("."));
		String filePath = destPath + fileName;
		String fileInfo = "&bNewLine=true";
		fileInfo += "&sFileName=" + fileName;
		fileInfo += "&sFileURL=" + "/ucar/upload/" + memberVO.getMemberId()+ "/" + fileName;
		map.put("filePath", filePath);
		map.put("fileInfo", fileInfo);
		return map;
	}
	@Transactional
	public void registerFile(ReviewVO reviewVO){
		reviewDAO.deleteFileByReviewNo(reviewVO.getReviewNo());
		String content=reviewVO.getReviewContent();
		ReviewFileVO rfvo=new ReviewFileVO();
		rfvo.setReviewNo(reviewVO.getReviewNo());
		List<String> list=convertHtmlimg(content);
		System.out.println("img:"+list);
		for(String imgUrl : list){			
			String imgName[]=imgUrl.split("/");
			String fileName=imgName[imgName.length-1].toString();
			rfvo.setFilePath(viewPath+reviewVO.getMemberId()+"/"+fileName);
			reviewDAO.registerFile(rfvo);
		}
	}
	public static List<String> convertHtmlimg(String img) {
		Pattern nonValidPattern = Pattern
				.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");

		List<String> result = new ArrayList<String>();
		Matcher matcher = nonValidPattern.matcher(img);
		while (matcher.find()) {
			result.add(matcher.group(1));
		}
		return result;
	}
	@Override
	public List<ReviewVO> getBestReview(){
		List<Integer> list= reviewDAO.getBestReviewNo();
		 List<ReviewVO> bestReviewList= new ArrayList<ReviewVO>();
		for(int i=0;i<list.size();i++){
			bestReviewList.add(reviewDAO.getBestReviewByReviewNo(list.get(i)));
		}
		return bestReviewList;
	}
}
