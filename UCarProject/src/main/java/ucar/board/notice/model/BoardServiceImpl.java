package ucar.board.notice.model;


import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import ucar.common.model.PagingBean;
@Service
public class BoardServiceImpl implements BoardService {
	@Resource(name="boardDAOImpl")
	private BoardDAO boardDAO;		
	@Override
	public void write(BoardVO bvo){
		boardDAO.write(bvo);
	}	
	@Override
	public ListVO getBoardList(String pageNo){
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		List<BoardVO> list=boardDAO.getBoardList(pageNo);
		int total=boardDAO.totalContent();
		PagingBean paging=new PagingBean(total,Integer.parseInt(pageNo));
		ListVO lvo=new ListVO(list,paging);
		return lvo;
	}
	@Override
	public BoardVO showContent(int qnaNo){
		//boardDAO.updateCount(no);
		System.out.println("service" +qnaNo);
		return boardDAO.showContent(qnaNo);
	}
	@Override
	public BoardVO showContentNoHit(int no){		
		return boardDAO.showContent(no);
	}
	@Override
	public boolean checkPass(String no,String pass) {	
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("no", no);
		map.put("pass", pass);
		int count=boardDAO.checkPass(map);
		boolean flag=false;
		if(count>0)
			flag=true;
		return flag;
	}	
	
	@Override
	public void deleteBoard(int noticeNo){
		System.out.println("서비스 no: "+ noticeNo);
		boardDAO.deleteBoard(noticeNo);
	}
	
	@Override
	public void updateBoard(BoardVO bvo){
		boardDAO.updateBoard(bvo);
	}
	/**
	 * 응답 처리 하는 메소드 <br>
	 * 응답 내용을 BoardVO로 받아 처리 한다. <br>
	 * 
	 * work flow : 
	 * 1. 현재 답변 하려는 글과 같은 ref 이고 대상답변글 restep 보다
	 *   큰 답변글들의 restep의 값을 +1 시킨다.
	 * 2. bvo 의 restep과 relevel의 값을 하나 증가 시킨다
	 *    (bvo의 restep, relevel의 값은 현재 답변글의 것이 아니라 원본글의 것이므로 값을 증가시킨다.)
	 * 3. database에 답변글 insert 작업을 처리한다.	
	 */
	/*public void reply(BoardVO bvo) {
						
	}*/
/*	@Override
	public void insertRef(BoardVO vo) {
		int ref = vo.getRef();
		int restep = vo.getRestep();
		int relevel = vo.getRelevel();
		boardDAO.updateRestep(ref, restep);
		//update 처리 후
		//원본 글의 것보다 restep과 relevel이 1씩 커야 하므로
		//입력 전에 restep값 과 relevel의 값을 1씩 증가하여 insert시킨다.
		vo.setRestep(restep+1);
		vo.setRelevel(relevel+1);
		boardDAO.insertRef(vo);//답변 글 입력								
	}*/
	@Override
	public void insertRef(BoardVO vo) {
		// TODO Auto-generated method stub
		
	}
}








