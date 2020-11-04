package global.sesoc.good.dao;


import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.good.vo.Board;
import global.sesoc.good.dao.BoardMapper;


@Repository
public class BoardDao {

	
	@Autowired
	private SqlSession session;
	
	public void listBoard(Board b) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		 mapper.listBoard(b);
		
	}
	
	public int getTotal(String searchText) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		int total = mapper.getTotal(searchText);
		return total;
	}

	public ArrayList<Board> pagingBoard(String searchText, int startRecord, int countPerPage){
		BoardMapper mapper =session.getMapper(BoardMapper.class);

		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ArrayList<Board> list= mapper.pagingBoard(searchText, rb);
		
		return list;
	}
	
	public Board readOne(int boardnum){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		Board b = mapper.readOne(boardnum);
	
		return b;
	}
}


