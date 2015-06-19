package ucar.common.pointhistory.model;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class PointHistoryServiceImpl implements PointHistoryService {
	@Resource
	private PointHistoryDAO pointHistoryDAO;
}
