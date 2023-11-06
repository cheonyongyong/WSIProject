package kr.or.ddit.service.main.impl;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.main.MailHandler;
import kr.or.ddit.mapper.main.MainMapper;
import kr.or.ddit.service.main.IMainService;
import kr.or.ddit.vo.CustomerVO;
import kr.or.ddit.vo.FuncInfoVO;
import kr.or.ddit.vo.InqBoardVO;
import kr.or.ddit.vo.LevelInfoVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.PaymentVO;

@Service
public class MainServiceImpl implements IMainService {

	@Inject
	private MainMapper mainMapper;
	
	@Autowired
	JavaMailSender mailSender;
	
	// 문의게시판 페이징
	@Override
	public int selectBoardCount(PaginationInfoVO<InqBoardVO> pagingVO) {
		return mainMapper.selectBoardCount(pagingVO);
	}
	
	// 문의게시판 리스트
	@Override
	public List<InqBoardVO> selectBoardList(PaginationInfoVO<InqBoardVO> pagingVO) {
		return mainMapper.selectBoardList(pagingVO);
	}

	// 문의게시판 등록
	@Override
	public ServiceResult insertBoard(HttpServletRequest req, InqBoardVO inqBoardVO) {
		ServiceResult result = null;
		int status = mainMapper.insertBoard(inqBoardVO);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	@Override
	public InqBoardVO selectBoard(int inqNo) {
		return mainMapper.selectBoard(inqNo);
	}

	// 문의게시판 수정
	@Override
	public ServiceResult updateBoard(HttpServletRequest req, InqBoardVO inqBoardVO) {
		ServiceResult result = null;
		int status = mainMapper.updateBoard(inqBoardVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
			
			
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}

	// 문의게시판 삭제
	@Override
	public ServiceResult deleteBoard(HttpServletRequest req, int inqNo) {
		ServiceResult result = null;
		
		InqBoardVO inqBoardVO = mainMapper.selectBoard(inqNo);
		
		int status = mainMapper.deleteBoard(inqNo);
		if(status > 0) {
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAILED;
		}
		return result;
	}

	// 문의게시판 답글 작성
	@Override
	public ServiceResult replyBoard(HttpServletRequest req, InqBoardVO inqBoardVO) {
		ServiceResult result = null;
		int status = mainMapper.replyBoard(inqBoardVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
			
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}
	
//	@Override
//	public void sendReplyMail(InqBoardVO inqBoardVO) throws MessagingException, UnsupportedEncodingException {
//		
//		MailHandler sendMail = new MailHandler(mailSender);
//		sendMail.setSubject("[WSI] 문의하신 글에 답글이 달렸습니다!");
//		sendMail.setText(
//				"<h3>" + inqBoardVO.getCustomerVO().getCusName() + "님! 문의하신 글에 답글이 달렸습니다!</h3>" + 
//				"<br>답변을 확인해보세요!" + 
//				"<br><a href='http://localhost/askboard target='_blank'>문의게시판으로 바로가기</a>");
//		sendMail.setFrom("teamwsi404@gmail.com", "WSI 관리자");
//		sendMail.setTo("jinny17099@gmail.com");
//		sendMail.send();
//	}


	// 비밀번호 찾기
	@Override
	public CustomerVO userPwCheck(CustomerVO customerVO) {
		return mainMapper.userPwCheck(customerVO);
	}

	// 구매
	@Override
	public ServiceResult insertPayment(HttpServletRequest req, PaymentVO paymentVO) {
		ServiceResult result = null;
		int status = mainMapper.insertPayment(paymentVO);
		
		if(status > 0) {
			result = ServiceResult.OK;
			// 추가
			String payCode = paymentVO.getPayCode();
			//
			mainMapper.insertPaymentDetail(paymentVO);
			mainMapper.insertFuncLevel(paymentVO);
			mainMapper.updatePrice(paymentVO);
			
		}else {
			result = ServiceResult.FAILED;
		}
		
		return result;
	}


	@Override
	public PaymentVO paymentDetail(String payCode) {
		return mainMapper.paymentDetail(payCode);
	}

	@Async
	@Override
	public void sendMail(CustomerVO customer) throws MessagingException, UnsupportedEncodingException {
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("WSI 시스템 구매 메일입니다!");
		sendMail.setText(
				"<h3>" + customer.getCusName() + "님! WSI 시스템을 구매해주셔서 감사합니다!</h3>" + 
				"<br>시스템을 이용해보세요!" + 
				"<br><a href='http://localhost/home/feed' target='_blank'>시스템으로 바로가기</a>");
		sendMail.setFrom("teamwsi404@gmail.com", "WSI 관리자");
		sendMail.setTo(customer.getCusEmail());
		sendMail.send();
		
		
	}

	

//	@Override
//	public CustomerVO selectCustomerEmail(String cusRnum) {
//		return mainMapper.selectCustomerEmail(cusRnum);
//	}

//	@Override
//	public PaymentVO selectPayCode(String cusRnum) throws Exception {
//		
////		MailHandler sendMail = new MailHandler(mailSender);
////		CustomerVO customerVO = new CustomerVO();
////		sendMail.setSubject("WSI 시스템 구매 메일입니다!");
////		sendMail.setText(
////				"<h3>" + customerVO.getCusName() + "님! WSI 시스템을 구매해주셔서 감사합니다!</h3>" + 
////				"<br>시스템을 이용해보세요!" + 
////				"<br><a href='http://localhost/home/feed' target='_blank'>시스템으로 바로가기</a>");
////		sendMail.setFrom("teamwsi404@gmail.com", "WSI 관리자");
////		sendMail.setTo("jinny17099@gmail.com");
////		sendMail.send();
////		
//		return mainMapper.selectPayCode(cusRnum);
//	}

//	@Override
//	public ServiceResult updatePayStatus(HttpServletRequest req, PaymentVO paymentVO) {
//		ServiceResult result = null;
//		
//		int status = mainMapper.updatePayStatus(req, paymentVO);
//		
//		if(status > 0) {
//			result = ServiceResult.OK;
//		}else {
//			result = ServiceResult.FAILED;
//		}
//		
//		return result;
//	}

//	@Override
//	public ServiceResult updatePayStatus(@Param("payCode") String payCode, HttpServletRequest req, PaymentVO paymentVO) {
//		ServiceResult result = null;
//		
//		int status = mainMapper.updatePayStatus(payCode, req, paymentVO);
//		
//		if(status > 0) {
//			result = ServiceResult.OK;
//		}else {
//			result = ServiceResult.FAILED;
//		}
//		
//		return result;
//		
//	}
	
}
