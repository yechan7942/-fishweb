package global.sesoc.good.dao;

import java.util.ArrayList;
import global.sesoc.good.vo.Reply;

public interface ReplyMapper {

		public int insert(Reply comment);
		
		public ArrayList<Reply> list();

		public int delete(int num);
		
	}

