package kr.or.ddit.service.work.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.work.WorkMapper;
import kr.or.ddit.service.work.IWorkService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.VacationPersonalVO;
import kr.or.ddit.vo.WorkVO;

@Service
public class WorkServiceImpl implements IWorkService {

	@Inject
	private WorkMapper workMapper;
	
	@Override
	public String adminCheck(String empNo) {
		return workMapper.adminCheck(empNo);
	}

	@Override
	public List<EmpVO> empList() {
		return workMapper.empList();
	}

	@Override
	public List<WorkVO> workList(HashMap<String, String> workMap) {
		return workMapper.workList(workMap);
	}

	@Override
	public List<WorkVO> teamWorkList(HashMap<String, String> map) {
		return workMapper.teamWorkList(map);
	}

	@Override
	public List<WorkVO> workManageList(HashMap<String, String> map) {
		return workMapper.workManageList(map);
	}

	@Override
	public List<WorkVO> selectWork(HashMap<String, String> workMap) {
		return workMapper.selectWork(workMap);
	}

	@Override
	public List<WorkVO> workApplyList(HashMap<String, String> map) {
		return workMapper.workApplyList(map);
	}

	@Override
	public List<WorkVO> workManagement(HashMap<String, String> map) {
		return workMapper.workManagement(map);
	}

	@Override
	public int selectTeamWorkCount(PaginationInfoVO<WorkVO> pagingVO) {
		return workMapper.selectTeamWorkCount(pagingVO);
	}

	@Override
	public List<WorkVO> selectTeamWorkList(PaginationInfoVO<WorkVO> pagingVO) {
		return workMapper.selectTeamWorkList(pagingVO);
	}

	@Override
	public int selectWorkManageCount(PaginationInfoVO<WorkVO> pagingVO) {
		return workMapper.selectWorkManageCount(pagingVO);
	}

	@Override
	public List<WorkVO> selectWorkManageList(PaginationInfoVO<WorkVO> pagingVO) {
		return workMapper.selectWorkManageList(pagingVO);
	}

	

	

}
