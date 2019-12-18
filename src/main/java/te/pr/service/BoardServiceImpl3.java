package te.pr.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import te.pr.common.Criteria;
import te.pr.common.SearchCriteria;
import te.pr.dao.boardDao3;
import te.pr.domain.boardVO;

@Service
public class BoardServiceImpl3 implements BoardService3 {
	
	@Inject
	private boardDao3 dao;

	@Override
	public List<boardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return dao.listAll();
	}

	@Override
	public void insert(boardVO board) throws Exception {
		// TODO Auto-generated method stub
		dao.insert(board);
	}

	@Override
	public boardVO read(Integer bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}

	@Override
	public int countlist() throws Exception {
		// TODO Auto-generated method stub
		return dao.countlist();
	}

	@Override
	public List<boardVO> listCriteria(Criteria criteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCriteria(criteria);
	}

	@Override
	public void update(boardVO board) throws Exception {
		// TODO Auto-generated method stub
		dao.update(board);
	}

	@Override
	public void delete(Integer num) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(num);
	}

	@Override
	public List<boardVO> listSearch(SearchCriteria searchCriteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.listSearch(searchCriteria);
	}

	@Override
	public int countSearch(SearchCriteria searchCriteria) throws Exception {
		// TODO Auto-generated method stub
		return dao.countSearch(searchCriteria);
	}
	
	
}
