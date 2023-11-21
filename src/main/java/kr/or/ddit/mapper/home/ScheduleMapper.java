package kr.or.ddit.mapper.home;

import java.util.List;

import kr.or.ddit.vo.ScheduleVO;
<<<<<<< HEAD
import kr.or.ddit.vo.TodoVO;

public interface ScheduleMapper {
	
	/**
	 * 일정을 등록하는 매퍼
	 * @param schedule 객체
	 * @return 등록 결과
	 */
	public int insert(ScheduleVO schedule);
	
	/**
	 * 일정 정보를 가져오는 매퍼
	 * @return 일정
	 */
	public List<ScheduleVO> findAll(String empNo);
	
	/**
	 * 팀 일정을 가져오는 매퍼
	 * @param empDept 부서코드
	 * @return 일정
	 */
	public List<ScheduleVO> findDept(String empDept);
	
	/**
	 * 일정을 삭제하는 매퍼
	 * @param start 삭제할 날짜
	 * @return 삭제 결과
	 */
	public int delete(String start);
	
	/**
	 * 일정을 수정하는 매퍼
	 * @param schedule 수정할 객체
	 * @return 수정 결과
	 */
	public int update(ScheduleVO schedule);

	/**
	 * todoList내역을 가져오는 매퍼
	 * @param empNo 사번
	 * @return todoList
	 */
	public List<TodoVO> selectTodoList(String empNo);

	/**
	 * todoList 등록하는 매퍼
	 * @param todoVO 객체
	 * @return 등록결과
	 */
	public int insertTodoList(TodoVO todoVO);

	/** 
	 * todoList 삭제하는 매퍼
	 * @param todoVO
	 * @return
	 */
	public int deleteTodoList(TodoVO todoVO);

=======

public interface ScheduleMapper {
	// 저장
	public int insert(ScheduleVO schedule);
	
	// DB에 저장되어 있는 스케쥴 정보 가져오기
	public List<ScheduleVO> findAll();
	
	// 삭제하기
	public int delete(String start);
	
	// 수정하기
	public int update(ScheduleVO schedule);
>>>>>>> branch 'master' of https://github.com/cheonyongyong/finalProject
}
