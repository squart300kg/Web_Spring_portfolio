package te.pr.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import te.pr.domain.boardVO;
import te.pr.service.BoardService1;
import te.pr.domain.replyVO;
import te.pr.service.replyService1;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@RestController
public class replyController1 {
	private static final Logger logger 
		= LoggerFactory.getLogger(replyController1.class);
	
	
	@Inject
	private replyService1 Rservice;
	




@RequestMapping(value="/reply1",method=RequestMethod.POST)
public @ResponseBody replyVO register(@RequestBody replyVO reply) throws Exception {
	
	logger.info(reply.toString());
	
	System.out.println("json  recon");
	
		 Rservice.insertreply(reply);
	
	
	return reply;
}



}








