package ucar.board.qna.model;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class QnaBoardServiceImpl implements QnaBoardService {
	@Resource(name="qnaBoardDAOImpl")
	private QnaBoardDAO qnaboardDAO;		
	@Override
	public void write(QnaBoardVO bvo){
		qnaboardDAO.write(bvo);
	}	
	@Override
	public QnaListVO getBoardList(String pageNo, String sessionId){
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		ArrayList<QnaBoardVO> resultList = new ArrayList<QnaBoardVO>();
		List<QnaBoardVO> list=qnaboardDAO.getBoardList(pageNo);
		System.out.println("aaaa"+sessionId);
		for(int i =0; i<list.size(); i++) {
			System.out.println("리스트이름"+list.get(i).getQnaMemberId());
				resultList.add(list.get(i));
		}
		int total=qnaboardDAO.totalContent();
		PagingBean paging=new PagingBean(total,Integer.parseInt(pageNo));
		QnaListVO lvo=new QnaListVO(resultList,paging);
		return lvo;
	}
	@Override
	public QnaBoardVO showContent(int no){
		return qnaboardDAO.showContent(no);
	}
	@Override
	public QnaBoardVO showContentNoHit(int no){		
		return qnaboardDAO.showContent(no);
	}
	@Override
	public boolean checkPass(String no,String pass) {	
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("no", no);
		map.put("pass", pass);
		int count=qnaboardDAO.checkPass(map);
		boolean flag=false;
		if(count>0)
			flag=true;
		return flag;
	}	
	
	@Override
	public void deleteBoard(String no){
		qnaboardDAO.deleteBoard(no);
	}
	
	@Override
	public void updateBoard(QnaBoardVO bvo){
		qnaboardDAO.updateBoard(bvo);
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
	@Override
	public void insertRef(QnaBoardVO vo) {
		int ref = vo.getQnaRef();
		int restep = vo.getQnaRestep();
		int relevel = vo.getQnaRelevel();
		qnaboardDAO.updateRestep(ref, restep);
		//update 처리 후
		//원본 글의 것보다 restep과 relevel이 1씩 커야 하므로
		//입력 전에 restep값 과 relevel의 값을 1씩 증가하여 insert시킨다.
		vo.setQnaRestep(restep+1);
		vo.setQnaRelevel(relevel+1);
		qnaboardDAO.insertRef(vo);//답변 글 입력								
	}
}








