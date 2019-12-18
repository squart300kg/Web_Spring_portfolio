package te.pr.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import te.pr.common.Criteria;
import te.pr.common.SearchCriteria;
import te.pr.domain.boardVO;
import org.springframework.stereotype.Repository;
@Repository
public class boardDaoImpl4 implements boardDao4 {

	@Inject
	private SqlSession session;
	
	private static String namespace1 = "te.pr.mapper.boardMapper4";
	
	
	@Override
	public List<boardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace1 + ".listAll");
	}

	@Override
	public void insert(boardVO vo) throws Exception {
		// TODO Auto-generated method stub
		session.insert(namespace1 + ".insert", vo);
	}

	@Override
	public boardVO read(Integer num) throws Exception {
		// TODO Auto-generated method stub
		
				session.update(namespace1+".readcount",num);
		
		return session.selectOne(namespace1 + ".read", num );
	}

	@Override
	public int countlist() throws Exception {
		// TODO Auto-generated method stub
		int count = session.selectOne(namespace1 + ".countlist");
		System.out.println(count);
		return count;
	}

	@Override
	public List<boardVO> listPaging(int page) throws Exception {
		// TODO Auto-generated method stub
		if(page <=0) {
			page=1;
		}
		page = (page-1)*10;
		
		return session.selectList(namespace1 + ".listPaging", page);
		
		
	}

	@Override
	public List<boardVO> listCriteria(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace1 + ".listCriteria" , criteria);
	}

	@Override
	public void update(boardVO board) throws Exception {
		// TODO Auto-generated method stub
		
		session.update(namespace1 + ".update", board);
		
	}

	@Override
	public void delete(Integer num) throws Exception {
		// TODO Auto-generated method stub
		
		session.delete(namespace1+".delete", num);
		session.delete(namespace1+".deleteNum", num);
		
	}

	@Override
	public List<boardVO> listSearch(SearchCriteria searchCriteria) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList(namespace1 + ".listSearch", searchCriteria);
	}

	@Override
	public int countSearch(SearchCriteria searchCriteria) throws Exception {
		// TODO Auto-generated method stub
		
		System.out.println("count : " + searchCriteria.getKeyword());
		System.out.println("count : " + searchCriteria.getSearchType());
		
		
		int count = session.selectOne(namespace1 + ".countSearch", searchCriteria);
	  
		System.out.println("count : " + count);
		
		return count;
	   
	}
	
	
	
	
}
