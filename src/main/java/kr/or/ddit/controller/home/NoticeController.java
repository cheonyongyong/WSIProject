package kr.or.ddit.controller.home;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.ServiceResult;
import kr.or.ddit.controller.util.MediaUtils;
import kr.or.ddit.service.common.ICommonService;
import kr.or.ddit.service.home.IHomeService;
import kr.or.ddit.vo.AttachVO;
import kr.or.ddit.vo.BoardVO;
import kr.or.ddit.vo.CustomUser;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.MenuVO;
import kr.or.ddit.vo.PaginationInfoVO;
import kr.or.ddit.vo.TreeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/notice")
public class NoticeController {

	@Inject
	private IHomeService HomeService;
	@Inject
	private ICommonService CommonService;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_MEMBER')")
	@RequestMapping(value = "/list")
	public String notice(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage, 
			@RequestParam(required = false, defaultValue = "title") String searchType, 
			@RequestParam(required = false) String searchWord, 
			@RequestParam(required = false, defaultValue = "a") String boardCate, 
			Model model) {
		log.info("notice() 실행...!");
		
		PaginationInfoVO<BoardVO> pagingVO = new PaginationInfoVO<BoardVO>();
		pagingVO.setBoardCate(boardCate);
		
		// 검색이 이뤄지면 아래가 실행됨
		if(StringUtils.isNotBlank(searchWord)) {
			pagingVO.setSearchType(searchType);
			pagingVO.setSearchWord(searchWord);
			model.addAttribute("searchType", searchType);
			model.addAttribute("searchWord", searchWord);
		}
		
		pagingVO.setCurrentPage(currentPage);	// startRow, endRow, startPage, endPage가 결정
		int totalRecord = HomeService.selctBoardCount(pagingVO);
		
		pagingVO.setTotalRecord(totalRecord);	// totalPage 설정
		List<BoardVO> boardList = HomeService.selectBoardList(pagingVO);
		pagingVO.setDataList(boardList);
		
		model.addAttribute("pagingVO", pagingVO);
		
		List<TreeVO> deptList = CommonService.selectCommonList("a"); 
		model.addAttribute("deptList", deptList);
		
		MenuVO menu1 = new MenuVO("홈 피드", "/home/feed");
		MenuVO menu2 = new MenuVO("회사소식", "/notice/list");
		List<MenuVO> menuList = Arrays.asList(menu1, menu2);
		model.addAttribute("menuList", menuList);
		
		MenuVO menu4 = new MenuVO("공지사항", "/notice/list");
		List<MenuVO> submenuList = Arrays.asList(menu4);
		model.addAttribute("submenuList", submenuList);
		
		model.addAttribute("currentURL", "/notice/list");
		
		return "home/notice/list";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_MEMBER')")
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerForm(Model model, BoardVO boardVO) {
		log.info("registerForm() 실행...!");
		
		List<TreeVO> deptList = CommonService.selectCommonList("a");
		model.addAttribute("deptList", deptList);
		
		MenuVO menu1 = new MenuVO("홈 피드", "/home/feed");
		MenuVO menu2 = new MenuVO("회사소식", "/notice/list");
		List<MenuVO> menuList = Arrays.asList(menu1, menu2);
		model.addAttribute("menuList", menuList);
		
		MenuVO menu4 = new MenuVO("공지사항", "/notice/list");
		List<MenuVO> submenuList = Arrays.asList(menu4);
		model.addAttribute("submenuList", submenuList);
		
		model.addAttribute("currentURL", "/notice/list");
		
		return "home/notice/register";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_MEMBER')")
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(
			HttpServletRequest req,
			RedirectAttributes ra,
			BoardVO boardVO, Model model) throws Exception {
		log.info("register() 실행...!");
		String goPage = "";
		
		CustomUser user = (CustomUser)SecurityContextHolder.getContext().getAuthentication().getPrincipal(); // 시큐리티에 담긴 로그인된 유저 정보
		EmpVO empVO = user.getEmp();
		
		boardVO.setBoardWriter(CommonService.selectCommon(empVO.getEmpDept())+" "+CommonService.selectCommon(empVO.getEmpPos()));	// 로그인 한 사용자 아이디 설정
		boardVO.setBoardEmpno(empVO.getEmpNo());	// 로그인 한 사용자 아이디 설정
		ServiceResult result = HomeService.registerBoard(req, boardVO);
		
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("smessage", "게시글 작성 완료!");
			ra.addFlashAttribute("sendmessage","200101001,공지사항을 확인해주세요.");
			ra.addFlashAttribute("emp", empVO);
			goPage = "redirect:/notice/detail?boardNo=" + boardVO.getBoardNo();
		}else {
			ra.addFlashAttribute("emessage", "서버에러, 다시 시도해주세요.");
			goPage = "home/notice/register";
		}
		
		MenuVO menu1 = new MenuVO("홈 피드", "/home/feed");
		MenuVO menu2 = new MenuVO("회사소식", "/notice/list");
		List<MenuVO> menuList = Arrays.asList(menu1, menu2);
		model.addAttribute("menuList", menuList);
		
		MenuVO menu4 = new MenuVO("공지사항", "/notice/list");
		List<MenuVO> submenuList = Arrays.asList(menu4);
		model.addAttribute("submenuList", submenuList);
		
		model.addAttribute("currentURL", "/notice/list");
		
		return goPage;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_MEMBER')")
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String detail(String boardNo, Model model) {
		log.info("detail() 실행...!");
		
		BoardVO boardVO = HomeService.selectBoard(boardNo);
		model.addAttribute("board", boardVO);
		
		MenuVO menu1 = new MenuVO("홈 피드", "/home/feed");
		MenuVO menu2 = new MenuVO("회사소식", "/notice/list");
		List<MenuVO> menuList = Arrays.asList(menu1, menu2);
		model.addAttribute("menuList", menuList);
		
		MenuVO menu4 = new MenuVO("공지사항", "/notice/list");
		List<MenuVO> submenuList = Arrays.asList(menu4);
		model.addAttribute("submenuList", submenuList);
		
		model.addAttribute("currentURL", "/notice/list");
		
		
		return "home/notice/detail";
	}
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public ResponseEntity<byte[]> fileDownload(String fileNo) throws IOException {
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		
		String fileName = null;
		AttachVO fileVO = HomeService.selectFileInfo(fileNo);
		
		if(fileVO != null) {
			fileName = fileVO.getFileOrgname();
			try {
				String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
				MediaType mType = MediaUtils.getMediaType(formatName);
				HttpHeaders headers = new HttpHeaders();
				in = new FileInputStream(fileVO.getFileSavepath());
				
//				if(mType != null) {		// 미디어타입일때 미리보기
//					headers.setContentType(mType);
//				}else {		// 미디어가 아니면 다운로드하려는 의도
					fileName = fileName.substring(fileName.indexOf("_") + 1);
					headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
					headers.add("Content-Disposition", "attachment; filename=\"" +
							new String(fileName.getBytes("UTF-8"), "ISO-8859-1")  + "\"");
//				}
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
			} catch (Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
			}finally {
				if(in != null) {
					in.close();
				}
			}
		}else {
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_MEMBER')")
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(
			RedirectAttributes ra,
			String boardNo, Model model) {
		log.info("delete() 실행...!");
		
		String goPage = "";
		ServiceResult result = HomeService.deleteBoard(boardNo);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "삭제가 완료되었습니다!");
			goPage = "redirect:/notice/list";
		}else {
			ra.addFlashAttribute("message", "서버오류, 다시 시도해주세요!");
			goPage = "redirect:/notice/detail.do?boardNo=" + boardNo;
		}
		return goPage;
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_MEMBER')")
	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public String updateForm(String boardNo, Model model) {
		log.info("updateForm() 실행...!");
		
		List<TreeVO> deptList = CommonService.selectCommonList("a");
		model.addAttribute("deptList", deptList);
		
		BoardVO boardVO = HomeService.selectBoard(boardNo);
		model.addAttribute("board", boardVO);
		model.addAttribute("status", "u");
		return "home/notice/register";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_MEMBER')")
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(
			HttpServletRequest req,
			RedirectAttributes ra,
			BoardVO boardVO, Model model) {
		log.info("update() 실행...!");
		
		String goPage = "";
		ServiceResult result = HomeService.updateBoard(req, boardVO);
		if(result.equals(ServiceResult.OK)) {
			ra.addFlashAttribute("message", "수정이 완료되었습니다.");
			goPage = "redirect:/notice/detail?boardNo=" + boardVO.getBoardNo();
		}else {
			model.addAttribute("message", "수정에 실패했습니다1");
			model.addAttribute("board", boardVO);
			model.addAttribute("status", "u");
			goPage = "home/notice/register";
		}
		return goPage;
	}
}
