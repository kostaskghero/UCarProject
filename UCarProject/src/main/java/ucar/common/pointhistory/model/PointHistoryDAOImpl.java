package ucar.common.pointhistory.model;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class PointHistoryDAOImpl implements PointHistoryDAO{
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
}
