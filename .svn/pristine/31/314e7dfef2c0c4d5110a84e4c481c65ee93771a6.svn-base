package kr.or.ddit.mapper.settings;

import java.util.List;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.PayVO;
import kr.or.ddit.vo.SettingsVO;
import kr.or.ddit.vo.TreeVO;

public interface SettingMapper {

	SettingsVO vacCheck(String vacName);

	List<SettingsVO> vacList();

	SettingsVO selectCus(String cusRnum);

	int updateCus(SettingsVO vo);

	void insertCompFile(AttachVO attachVO);

	int registerVac(SettingsVO settingsVO);

	int deleteVac(String vacCode);

	int delCusFile(AttachVO attach);

	List<SettingsVO> empList();

	int empModifyAuth(SettingsVO settingsVO);

	List<TreeVO> deptist();

	List<TreeVO> deptList();

	List<TreeVO> searchList(TreeVO tree);

	List<TreeVO> posList();

	List<TreeVO> rankList();

	List<TreeVO> jobList();
	
	int insertEmp(EmpVO vo);

}
