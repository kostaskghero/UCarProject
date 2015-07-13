package ucar.common.pointhistory.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PointHistoryDAOImpl implements PointHistoryDAO{
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	/**
	 * sharing_point Table 에 pointHistoryVO 의 정보를 삽입한다.
	 */
	@Override
	public void insertPointHistory(PointHistoryVO pointHistoryVO) {
		sqlSessionTemplate.insert("point.insertPointHistory", pointHistoryVO);
	}
	
	/**
	 * member Table 의 memberPoint 를 감소시킨다.
	 */
	@Override
	public void memberPointSubtraction(PointHistoryVO pointHistoryVO) {
		sqlSessionTemplate.update("point.memberPointSubtraction", pointHistoryVO);
	}
	
	/**
	 * member Table 의 memberPoint 를 증가시킨다.
	 */
	@Override
	public void memberPointAddition(PointHistoryVO pointHistoryVO) {
		sqlSessionTemplate.update("point.memberPointAddition", pointHistoryVO);
	}

}
