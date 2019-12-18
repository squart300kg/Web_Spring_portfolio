package te.pr.dao;

import java.util.List;

import te.pr.domain.likeHistoryVO;
import te.pr.domain.replyVO;

public interface replyDao5 {
	
	public replyVO insertreply(replyVO vo) throws Exception;
	public List<replyVO>listReply(int num) throws Exception;
	public int getMaxRnum(int num) throws Exception;
	public void updateStep(int rnum) throws Exception;
	public void updateReply(replyVO vo) throws Exception;
	
	public likeHistoryVO likeCheck(likeHistoryVO vo) throws Exception;
	
	public likeHistoryVO insertLH(likeHistoryVO vo)throws Exception ;
	public replyVO insertrereply(replyVO vo) throws Exception;
	public void delRe(int rnum) throws Exception;
	public replyVO cModal(int rnum) throws Exception;
	
	
}
