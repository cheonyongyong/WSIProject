package kr.or.ddit.service.home.impl;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.util.FileuploadUtils;
import kr.or.ddit.mapper.arm.ArmMapper;
import kr.or.ddit.mapper.board.BoardMapper;
import kr.or.ddit.service.home.IHomeService;
import kr.or.ddit.vo.AlarmVO;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.PaginationInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class HomeServiceImpl implements IHomeService {

	@Inject
	private BoardMapper boardMapper;
	
	@Inject
	private ArmMapper armMapper;

	@Override
	public int selctBoardCount(PaginationInfoVO<BoardVO> pagingVO) {
		return boardMapper.selectBoardCount(pagingVO);
	}

	@Override
	public List<BoardVO> selectBoardList(PaginationInfoVO<BoardVO> pagingVO) {
		return boardMapper.selectBoardList(pagingVO);
	}
	
	@Override
	public ServiceResult registerBoard(HttpServletRequest req, BoardVO boardVO) throws Exception {
		ServiceResult result = null;
		int status = boardMapper.insertBoard(boardVO);
		boardVO.setBoardFile("a"+boardVO.getBoardNo());
		if(status > 0) {
			List<AttachVO> boardFileList = boardVO.getBoardFileList();
			FileuploadUtils.boardFileUpload(boardFileList, boardVO.getBoardFile(), boardVO.getBoardNo(), req, boardMapper);
			
			CustomUser user = (CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			
			AlarmVO alarmVO = new AlarmVO();	
			alarmVO.setArmSender(boardVO.getBoardEmpno());
			alarmVO.setArmReceiver("200101001");	// 팜하니로 일단 테스트
			alarmVO.setArmCont("새로운 공지사항이 등록되었습니다.");
			alarmVO.setArmUrl("/notice/detail?boardNo=" + boardVO.getBoardNo());
			alarmVO.setArmSendername(user.getEmp().getEmpName());
			armMapper.insertArm(alarmVO);
			
			result = ServiceResult.OK;
		}else {
			result  = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public BoardVO selectBoard(String boardNo) {
		return boardMapper.selectBoard(boardNo);
	}

	@Override
	public AttachVO selectFileInfo(String fileNo) {
		boardMapper.downcountFileInfo(fileNo);
		return boardMapper.selectFileInfo(fileNo);
	}

	@Override
	public ServiceResult deleteBoard(String boardNo) {
		ServiceResult result = null;
		int status2 = boardMapper.deleteBoardFile(boardNo);
		log.info("{}", status2);
		
		int status = boardMapper.deleteBoard(boardNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result  = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public ServiceResult updateBoard(HttpServletRequest req, BoardVO boardVO) {
		ServiceResult result = null;
		int status = boardMapper.updateBoard(boardVO);
		boardVO.setBoardFile(boardVO.getBoardFile());
		if(status > 0) {
			List<AttachVO> boardFileList = boardVO.getBoardFileList();
			try {
				
				FileuploadUtils.boardFileUpload(boardFileList, boardVO.getBoardFile(), boardVO.getBoardNo(), req, boardMapper);
				
				Integer[] delBoardNo = boardVO.getDelBoardNo();
				if(delBoardNo != null) {
					boardMapper.deleteBoardFileList(delBoardNo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

}
