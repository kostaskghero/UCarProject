package ucar.common.pointhistory.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PointHistoryDAOImpl implements PointHistoryDAO{
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void insertPointHistory(PointHistoryVO pointHistoryVO) {
		sqlSessionTemplate.insert("point.insertPointHistory", pointHistoryVO);
	}

	@Override
	public void memberPointSubtraction(PointHistoryVO pointHistoryVO) {
		sqlSessionTemplate.update("point.memberPointSubtraction", pointHistoryVO);
	}

	@Override
	public void memberPointAddition(PointHistoryVO pointHistoryVO) {
		sqlSessionTemplate.update("point.memberPointAddition", pointHistoryVO);
	}

}
