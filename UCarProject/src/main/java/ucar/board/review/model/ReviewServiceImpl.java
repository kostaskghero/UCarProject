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
import ucar.common.model.PagingBean;
import ucar.member.model.MemberVO;

@Service
public class ReviewServiceImpl implements ReviewService {
	@Resource
	private ReviewDAO reviewDAO;
	@Resource(name="uploadPath")
	private String path;
	@Resource(name="viewPath")
	private String viewPath;
	
	/**
	 * 이용후기를 등록하고 reviewContent 에 있는 이미지 태그를 추출해 파일을 등록한다.
	 */
	@Override
	public void writeReviewSavingPoint(ReviewVO vo) {
		reviewDAO.writeReview(vo);
		registerFile(vo);
	}
	/**
	 * 이용후기를 수정한다.
	 */
	@Transactional
	@Override
	public void updateReview(ReviewVO vo) {
		reviewDAO.updateReview(vo);
		registerFile(vo);
	}
	/**
	 * 이용후기를 삭제하고 함께 등록된 사진도 삭제한다.
	 */
	@Transactional
	@Override
	public void deleteReview(int reviewNo) {
		reviewDAO.deleteReview(reviewNo);
		reviewDAO.deleteFileByReviewNo(reviewNo);
	}
	/**
	 * 이용후기 페이지로 들어갔을때 
	 * 일반 이용후기를 보여주기위한 메서드 
	 * 해당 페이지에 들어갈 이용후기 리스트를 받아서
	 * 글 번호로 댓글 수와 추천수를 setting하여 페이징빈화함께
	 * ListVO로 리턴한다.
	 */
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
		return lvo;
	}
	/**
	 * 이용후기 상세보기 메서드
	 */
	
	@Override
	public ReviewVO showContent(int no) {
		reviewDAO.updateCount(no);
		return reviewDAO.showContent(no);
	}
	
	/**
	 * 조회수를 증가시키지 않고 글을 보여주는 메서드 
	 */
	
	@Override
	public ReviewVO showContentNoHit(int no) {
		return reviewDAO.showContent(no);
	}
	
	/**
	 * 글 번호로 작성된 댓글 목록을 찾아 반환하는 메서드
	 */
	@Override
	public List<ReviewCommentVO> getCommentListByReviewNo(int reviewNo) {
		return reviewDAO.getCommentListByReviewNo(reviewNo);
	}
	
	/**
	 * 추천은 중복할 수 없다.
	 * reviewNo 를 추천한 id 중 memberId 가 있으면 중복되므로 flag 에 fail 을 세팅한다.
	 * memberId 가 없으면 추가하고 flag 에 ok 를 세팅하고, 변경된 추천수를 likeCount 에 세팅한다.
	 */
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
	
	/**
	 * 추천을 취소한다.
	 * flag 에 ok 를 세팅하고, 변경된 추천수를 likeCount 에 세팅한다.
	 */
	@Override
	public HashMap<String, String> likeReviewCancel(ReviewVO reviewVO) {
		HashMap<String, String> map=new HashMap<String, String>();
		reviewDAO.deleteReviewLike(reviewVO);
		map.put("flag", "ok");
		map.put("likeCount", reviewDAO.findReviewLikeCountByReviewNo(reviewVO.getReviewNo()));
		return map;
	}
	
	/**
	 * 등록하려는 파일의 이름을 변경하고 경로 (절대경로) 를 지정한다.
	 * 관리를 위해 memberId 별로 별도의 디렉토리에 파일을 관리한다.
	 * memberId 에 해당하는 디렉토리가 없을 경우 디렉토리를 생성한다.
	 * 변경되는 파일은 명은 중복을 막기 위해 '아이디_현재시간.확장자' 의 형태로 변경한다.
	 */
	@Override
	public HashMap<String, String> fileNameFomat(MemberVO memberVO, 
			String oriName) throws Exception{
		// 회원 별로 별도의 디렉토리를 생성한다.
		HashMap<String, String> map=new HashMap<String, String>();
		oriName = URLDecoder.decode(oriName, "UTF-8");	
		String destPath = path + memberVO.getMemberId() + "\\";
		File file = new File(destPath);
		if (!file.exists()) {
			file.mkdirs();
		}
		// 등록한 파일의 파일명을 변환한다.
		String fileName = memberVO.getMemberId()+"_"+System.currentTimeMillis() 
				+ oriName.substring(oriName.lastIndexOf("."));
		String filePath = destPath + fileName;
		String fileInfo = "&bNewLine=true";
		fileInfo += "&sFileName=" + fileName;
		fileInfo += "&sFileURL=" + "/ucar/upload/" + memberVO.getMemberId()+ "/" + fileName;
		map.put("filePath", filePath);
		map.put("fileInfo", fileInfo);
		return map;
	}
	
	/**
	 * 파일을 DB 에 등록한다.
	 * reviewNo 를 외래키로 참조하는 파일을 모두 삭제하고
	 * reviewContent 에서 추출된 파일 정보를 이용해 서버에 저장된 경로 (상대경로) 를 DB 에 등록한다.
	 * @param reviewVO
	 */
	@Transactional
	public void registerFile(ReviewVO reviewVO){
		reviewDAO.deleteFileByReviewNo(reviewVO.getReviewNo());
		String content=reviewVO.getReviewContent();
		ReviewFileVO rfvo=new ReviewFileVO();
		rfvo.setReviewNo(reviewVO.getReviewNo());
		List<String> list=convertHtmlimg(content);
		for(String imgUrl : list){			
			String imgName[]=imgUrl.split("/");
			String fileName=imgName[imgName.length-1].toString();
			rfvo.setFilePath(viewPath+reviewVO.getMemberId()+"/"+fileName);
			reviewDAO.registerFile(rfvo);
		}
	}
	
	/**
	 * 이미지 태그를 추출해 파일 경로를 List 로 저장한다.
	 * @param img
	 * @return
	 */
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
	/**
	 * 베스트 이용후기 목록에 들어갈 상위 3개의 글 번호를 검색하고
	 * 해당 글 번호로 검색하여 베스트 이용후기 목록을 생성해 반환한다. 
	 */
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
