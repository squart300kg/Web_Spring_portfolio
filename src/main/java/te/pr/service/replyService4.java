package te.pr.service;

import java.util.List;

import te.pr.domain.likeHistoryVO;
import te.pr.domain.replyVO;

public interface replyService4 {
	
	public replyVO insertreply(replyVO reply) throws Exception;
	
	public List<replyVO> listReply(int num) throws Exception;
	
	
	public int getMaxRnum(int num) throws Exception;
	
	public void updateStep(int rnum) throws Exception;
	
	public replyVO insertrereply(replyVO reply) throws Exception;
	
	public likeHistoryVO likeCheck(likeHistoryVO vo) throws Exception;
	
	public void delRe(int rnum) throws Exception;
	
	public replyVO cModal(int rnum) throws Exception;
	
	public void updateReply(replyVO reply) throws Exception;
	
	public likeHistoryVO insertLH(likeHistoryVO vo)throws Exception ;
	
}
