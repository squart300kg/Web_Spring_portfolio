package te.pr.service;

import java.util.List;

import javax.inject.Inject;

import te.pr.dao.replyDao1;
import te.pr.domain.likeHistoryVO;
import te.pr.domain.replyVO;
import org.springframework.stereotype.Service;

@Service
public class replyServiceImpl5 implements replyService5 {
	
	@Inject
	private replyDao1 dao;


	@Override
	public replyVO insertreply(replyVO reply) throws Exception {
		// TODO Auto-generated method stub
	return	dao.insertreply(reply);
		
	}


	@Override
	public List<replyVO> listReply(int num) throws Exception {
		// TODO Auto-generated method stub
		return dao.listReply(num);
	}


	@Override
	public int getMaxRnum(int num) throws Exception {
		// TODO Auto-generated method stub
		return dao.getMaxRnum(num);
	}


	@Override
	public void updateStep(int rnum) throws Exception {
		// TODO Auto-generated method stub
		dao.updateStep(rnum);
	}


	@Override
	public replyVO insertrereply(replyVO reply) throws Exception {
		// TODO Auto-generated method stub
		return dao.insertrereply(reply);
	}


	@Override
	public void delRe(int rnum) throws Exception {
		// TODO Auto-generated method stub
		dao.delRe(rnum);
	}


	@Override
	public replyVO cModal(int rnum) throws Exception {
		// TODO Auto-generated method stub
		return dao.cModal(rnum);
		
	}


	@Override
	public void updateReply(replyVO reply) throws Exception {
		// TODO Auto-generated method stub
		dao.updateReply(reply);
	}


	@Override
	public likeHistoryVO likeCheck(likeHistoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.likeCheck(vo);
	}


	@Override
	public likeHistoryVO insertLH(likeHistoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		  return dao.insertLH(vo);
	}
	
	
}
