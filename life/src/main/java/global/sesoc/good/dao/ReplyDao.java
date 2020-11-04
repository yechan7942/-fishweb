package global.sesoc.good.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.good.vo.Reply;

@Repository
public class ReplyDao {

	@Autowired
	public SqlSession session;
	
	public int insert(Reply rp) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		int result = 0;
		result = mapper.insert(rp);
		return result;

	}
	
	
	//목록 읽기
	public ArrayList<Reply> list() {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
		
		ArrayList<Reply> replyList = null;
		
			replyList = mapper.list();
				
		return replyList;
	}
	
	//삭제
	public int delete(int num) {
		ReplyMapper mapper = session.getMapper(ReplyMapper.class);
	
		int result = 0;

		result = mapper.delete(num);
		return result;
	}
	
}
;