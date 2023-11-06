package kr.or.ddit.controller.home;

import java.util.Arrays;
import java.util.List;

import javax.inject.Inject;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.ddit.service.common.ICommonService;
import kr.or.ddit.service.home.IHomeService;
import kr.or.ddit.vo.MenuVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/home")
@Controller
public class HomeController {
	
	@Inject
	private IHomeService HomeService;
	@Inject
	private ICommonService CommonService;
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_MEMBER')")
	@RequestMapping(value = "/feed", method = RequestMethod.GET)
	public String feed(Model model) {
		log.info("feed() 실행...!");
		
		// 메인메뉴 리스트
		MenuVO menu1 = new MenuVO("홈 피드", "/home/feed");
		MenuVO menu2 = new MenuVO("회사소식", "/notice/list");
		List<MenuVO> menuList = Arrays.asList(menu1, menu2);
		model.addAttribute("menuList", menuList);
		
		// 서브메뉴 리스트
		MenuVO menu3 = new MenuVO("홈", "/home/feed");
		MenuVO menu4 = new MenuVO("일정", "/home/schedule");
		
		List<MenuVO> submenuList = Arrays.asList(menu3, menu4);
		model.addAttribute("submenuList", submenuList);
		
		model.addAttribute("currentURL", "/home/feed");
		
		return "home/gridstack";
	}
	
	@PreAuthorize("hasAnyRole('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_MEMBER')")
	@RequestMapping(value = "/schedule", method = RequestMethod.GET)
	public String schedule(Model model) {
		log.info("schedule() 실행...!");
		
		MenuVO menu1 = new MenuVO("홈 피드", "/home/feed");
		MenuVO menu2 = new MenuVO("회사소식", "/notice/list");
		List<MenuVO> menuList = Arrays.asList(menu1, menu2);
		model.addAttribute("menuList", menuList);
		
		// 서브메뉴 리스트
		MenuVO menu3 = new MenuVO("홈", "/home/feed");
		MenuVO menu4 = new MenuVO("일정", "/home/schedule");
		List<MenuVO> submenuList = Arrays.asList(menu3, menu4);
		model.addAttribute("submenuList", submenuList);
		
		model.addAttribute("currentURL", "/home/schedule");
		
		return "home/schedule";
	}
}
