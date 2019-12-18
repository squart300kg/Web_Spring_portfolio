package te.pr.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import te.pr.domain.replyVO;
import te.pr.service.replyService6;


@RestController
public class replyController6 {
	private static final Logger logger 
		= LoggerFactory.getLogger(replyController6.class);
	
	
	@Inject
	private replyService6 Rservice;
	




@RequestMapping(value="/reply6",method=RequestMethod.POST)
public @ResponseBody replyVO register(@RequestBody replyVO reply) throws Exception {
	
	logger.info(reply.toString());
	
	System.out.println("json  recon");
	
		 Rservice.insertreply(reply);
	
	
	return reply;
}



}








