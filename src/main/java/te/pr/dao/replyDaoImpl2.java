package te.pr.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import te.pr.domain.likeHistoryVO;
import te.pr.domain.replyVO;

import org.springframework.stereotype.Repository;
@Repository
public class replyDaoImpl2 implements replyDao3 {

	@Inject
	private SqlSession session;
	
	private static String namespace = "te.pr.mapper.replyMapper2";
	
	
	@Override
	public replyVO insertreply(replyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".insertreply", vo);
		int MaxRnum = session.selectOne(namespace + ".maxRnum" , vo.getNum());
		session.update(namespace + ".updateStep", MaxRnum );
		return vo;
	
	}

	@Override
	public int getMaxRnum(int num) throws Exception {
		// TODO Auto-generated method stub
		int MaxRnum = session.selectOne(namespace + ".maxRnum" , num);
		
		return MaxRnum;
	}


	@Override
	public void updateStep(int rnum) throws Exception {
		// TODO Auto-generated method stub
			
		session.update(namespace + ".updateStep", rnum );
		
		
	}
	
	@Override
	public List<replyVO> listReply(int num) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace + ".listReply", num);
	}

	@Override
	public replyVO insertrereply(replyVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace + ".insertrereply", vo);
		System.out.println(vo.getRnum());
		return vo;
	}

	@Override
	public void delRe(int rnum) throws Exception {
		// TODO Auto-generated method stub
	
		
		System.out.println("DAO rnum  : " + rnum);
		 try {
			 int deleteLevel = session.selectOne(namespace + ".selectLevel", rnum);
		System.out.println("DAO deleteLevel  : " + deleteLevel);
		
		
		if(deleteLevel == 0) {
			session.delete(namespace + ".delReRe",rnum);
		
		}else {
			session.delete(namespace + ".delRe", rnum);
			
		}
		
		 } catch (Exception e) {
			 return;
		 } 
		
		
	}

	@Override
	public replyVO cModal(int rnum) throws Exception {
		// TODO Auto-generated method stub
		
		return session.selectOne(namespace + ".cModal" , rnum);
	}

	@Override
	public void updateReply(replyVO vo) throws Exception {
		// TODO Auto-generated method stub
		 session.update(namespace + ".updateReply", vo);
	}

	@Override
	public likeHistoryVO likeCheck(likeHistoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		return session.selectOne(namespace + ".likeCheck" ,vo);
	}

	@Override
	public likeHistoryVO insertLH(likeHistoryVO vo) throws Exception {
		// TODO Auto-generated method stub
		
		session.insert(namespace + ".insertLH", vo);
		
		session.update(namespace + ".likeRe", vo);
		
		return vo;
		
	}

	
}
