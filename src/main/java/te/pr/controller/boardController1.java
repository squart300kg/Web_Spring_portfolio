package te.pr.controller;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.mybatisSetting2.dto.SquartDto;

import te.pr.common.Criteria;
import te.pr.common.PageMaker;
import te.pr.common.SearchCriteria;
import te.pr.domain.boardVO;
import te.pr.domain.likeHistoryVO;
import te.pr.domain.replyVO;
import te.pr.service.BoardService1;
import te.pr.service.replyService1;


@Controller
@RequestMapping("board1/*")
public class boardController1 {
	private static final Logger logger 
		= LoggerFactory.getLogger(boardController1.class);
	
	@Inject
	private BoardService1 service;
	
	@Inject
	private replyService1 Rservice;
	

	@RequestMapping(value="/insert", method=RequestMethod.GET)
	public void insertGET() throws Exception {
		logger.info("insertGet start");
		
		
	}
	
	@RequestMapping(value="/insert", method=RequestMethod.POST)
	public String insertPost(boardVO board, RedirectAttributes rattr) throws Exception{
		
		logger.info("Request mapping insert : ");
		logger.info(board.toString());
		
		service.insert(board);
		
		rattr.addFlashAttribute("msg", "SUCCESS");
		
		
		return "redirect:/board1/list";
	}
	
	
	
	@RequestMapping(value="/read/rereply",method=RequestMethod.POST)
	public String registerRere(HttpServletRequest request, HttpServletResponse response,replyVO reply ,Model model) throws Exception {
		
			 if(reply.getContent() == "") {
				
				 response.setContentType("text/html; charset=UTF-8");
				  PrintWriter writer = response.getWriter();
				  
				  writer.println("<script>alert('댓글입력바람!'); history.go(-1);</script>");
				  writer.flush();
				  return "redirect:/board1/read";
				  	
			}
			 
			 Rservice.insertrereply(reply);
			 model.addAttribute("num",reply.getNum());
			 
			 
		return "redirect:/board1/read";
	}

	
	@RequestMapping(value="/like",method=RequestMethod.GET)
	public String like(HttpServletRequest request, HttpServletResponse response, Model model,RedirectAttributes rttr) throws Exception {
		HttpSession session = request.getSession();
		
		int page = Integer.parseInt(request.getParameter("page"));
		int rnum = Integer.parseInt(request.getParameter("rnum"));
		int num  = Integer.parseInt(request.getParameter("num"));
		
		SquartDto squartDto = new SquartDto();
		squartDto = (SquartDto)session.getAttribute("User");
		
		String Lid = squartDto.getId();
		
		likeHistoryVO vo = new likeHistoryVO();
		
		vo.setLid(Lid);
		vo.setRnum(rnum);
		
		if(Rservice.likeCheck(vo) != null) {
				//	errors.rejectValue("id", "likeId");	
			System.out.println("like에서의 num : " + num);
			System.out.println("like에서의 page : " + page);
			model.addAttribute("num", num);
			model.addAttribute("page", page);
			  response.setContentType("text/html; charset=UTF-8");
			  PrintWriter writer = response.getWriter();
			  
			  writer.println("<script>alert('좋아요는 한아이디에 한번씩만!'); </script>");
			  writer.flush();


			System.out.println(" 되돌아온다");
			return "forward:/board1/read";
		}
		Rservice.insertLH(vo);
		System.out.println("like에서의 num : " + num);
		System.out.println("like에서의 page : " + page);
		rttr.addFlashAttribute("num", num);
		rttr.addFlashAttribute("page", page);
		 System.out.println(" 계속간다");
		return "forward:/board1/read";
	}
	
//	
	@RequestMapping(value="/read", method=RequestMethod.POST)
	public String insertreply(replyVO reply) throws Exception{
		
		System.out.println("insert post");
		logger.info("insertreply post");
		
//		
//		int Maxrnum = Rservice.getMaxRnum(num);
//		
//	//	Rservice.updateStep(Maxrnum);
//		
	return "/board1/read";
		
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public String read(HttpServletRequest request, @ModelAttribute Criteria criteria,   Model model) throws Exception{
		
		//게시판 번호를 받아온다
		int num = Integer.parseInt(request.getParameter("num"));
				
		//게시판 번호에 해당하는 데이터 : 제목, 내용, 글쓴이 의 정보를 가져온다.
		model.addAttribute(service.read(num));
		//게시판 번호를 전송
		model.addAttribute("num", num);
		//게시판 너비를 전송
		model.addAttribute("width", 5);
		//해당 게시판 번호에 해당하는 모든 리플을 List의 형태로 보낸다.
		model.addAttribute("rlist", Rservice.listReply(num));
				
		return "/board1/read";						
			
	}
	
	@RequestMapping(value="/readMo", method=RequestMethod.GET)
	public String readMo(@RequestParam(value = "num") int num,@RequestParam(value= "index", required=false , defaultValue="200") int ind , @ModelAttribute Criteria criteria,   Model model) throws Exception{
		
		model.addAttribute("ind", ind);
		model.addAttribute("num", num);
		
		return "redirect:/board1/read";
	}
	
	
	
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public void updateGET(@RequestParam("num") int num, Model model) throws Exception {
		System.out.println("update GET");
		logger.info("updateGet Strart....");
		model.addAttribute(service.read(num));
	
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String updatePOST(boardVO board, Model model) throws Exception {
		System.out.println("update POST");
		logger.info("RequestMapping update.....");
		logger.info(board.toString());
		System.out.println(board.getContent());
		service.update(board);
		
		model.addAttribute("num",board.getNum());
		 
		 
		return "redirect:/board1/read";
	}
	
	
	@RequestMapping(value="/delete",method=RequestMethod.POST)
	public String delete(@RequestParam("num") int num, RedirectAttributes rttr) throws Exception {
		
		service.delete(num);
		
		
		rttr.addFlashAttribute("msg","SUCCESS");
		logger.info("데이터삭제처리 bno  " + num);
		
		return "redirect:/board1/list";
	}
	
	@RequestMapping(value="/delRe",method=RequestMethod.GET)
	public String deleteRe(@RequestParam("page") int page,@RequestParam("rnum") int rnum, @RequestParam("num") int num,
			Model model) throws Exception {
		
		Rservice.delRe(rnum);
		
		model.addAttribute("num", num);
		model.addAttribute("page", page);
		 
		 
		return "redirect:/board1/read";
	}
	
	
	@RequestMapping(value="/updateReR",method=RequestMethod.GET)
	public String updateRe(@RequestParam("page") int page,@RequestParam("rnum") int rnum, @RequestParam("num") int num,
			 Model model) throws Exception {
		
		
		model.addAttribute(Rservice.cModal(rnum));
		
		model.addAttribute("num", num);
		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		 
		 
		return "/board1/updateReR";
	}
	
	@RequestMapping(value="/updateRR",method=RequestMethod.POST)
	public String updateRR(@RequestParam("page") int page,@RequestParam("rnum") int rnum, @RequestParam("num") int num,
			replyVO replyvo , Model model) throws Exception {
		
		System.out.println("updateRRRRRRR");
		System.out.println(replyvo.getContent());
		
		Rservice.updateReply(replyvo);
		
		model.addAttribute("num", num);
		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		 
		 
		return "redirect:/board1/updateRR";
	}
	
	@RequestMapping(value="/updateRR",method=RequestMethod.GET)
	public String updateRRGET(@RequestParam("page") int page,@RequestParam("rnum") int rnum, @RequestParam("num") int num,
			replyVO replyvo , Model model) throws Exception {
		
		System.out.println("updateRR GET");
		System.out.println(replyvo.getContent());
		
		
		model.addAttribute("num", num);
		model.addAttribute("page", page);
		model.addAttribute("rnum", rnum);
		 
		 
		return "redirect:/board1/read";
	}
	
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String search(@ModelAttribute("searchCriteria") SearchCriteria searchCriteria,Model model) throws Exception {

	PageMaker pageMaker = new PageMaker();
	pageMaker.setCriteria(searchCriteria);
	pageMaker.setTotalCount(service.countSearch(searchCriteria));
	
	model.addAttribute("slist", service.listSearch(searchCriteria));
	model.addAttribute("pageMaker", pageMaker);	
		
		return "/board1/list";
		
	}
	
}









