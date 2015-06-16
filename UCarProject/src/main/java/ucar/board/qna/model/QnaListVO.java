package ucar.board.qna.model;


import java.util.List;

/**
 * 게시물 리스트 정보와 페이징 정보를 가지고 있는 클래스 
 * @author inst
 *
 */
public class QnaListVO {
	private List<QnaBoardVO> list;
	private PagingBean pagingBean;
	
	public QnaListVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QnaListVO(List<QnaBoardVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<QnaBoardVO> getList() {
		return list;
	}

	public void setList(List<QnaBoardVO> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
}










