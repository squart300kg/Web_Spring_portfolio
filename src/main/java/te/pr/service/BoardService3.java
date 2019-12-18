package te.pr.service;

import java.util.List;

import te.pr.common.Criteria;
import te.pr.common.SearchCriteria;
import te.pr.domain.boardVO;

public interface BoardService3 {
	
	public List<boardVO> listAll() throws Exception;
	
	public void insert(boardVO board) throws Exception;
	
	public boardVO read(Integer bno) throws Exception;
	
	public int countlist() throws Exception;
	
	public List<boardVO>listCriteria(Criteria criteria) throws Exception;
	
	public void update(boardVO board) throws Exception;
	
	public void delete(Integer num) throws Exception;

	public List<boardVO> listSearch(SearchCriteria searchCriteria) throws Exception;
	
	public int countSearch(SearchCriteria searchCriteria) throws Exception;
	
	
}
