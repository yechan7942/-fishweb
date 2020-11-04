package global.sesoc.good.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;

import global.sesoc.good.vo.Board;

public interface BoardMapper {

	public void listBoard(Board b);

	public int getTotal(String searchText);
	
	public ArrayList<Board> pagingBoard(String searchText, RowBounds rb);
	
	public Board readOne(int boardnum);
	
}
