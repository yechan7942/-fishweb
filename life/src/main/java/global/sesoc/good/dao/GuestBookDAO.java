package global.sesoc.good.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.good.vo.GuestBook;

@Repository
public class GuestBookDAO {

	@Autowired
	private SqlSession session;

	public int insertGuestbook(GuestBook guestbook) {
		GuestBookMapper mapper = session.getMapper(GuestBookMapper.class);
		int cnt = mapper.insertGuestbook(guestbook);
		return cnt;
	}
	
	public ArrayList<GuestBook> list(){
		GuestBookMapper mapper = session.getMapper(GuestBookMapper.class);
		ArrayList<GuestBook> list=mapper.list();
		return list;
	}
	public int deleteGuestbook(GuestBook guestbook) {
		GuestBookMapper mapper = session.getMapper(GuestBookMapper.class);
		int cnt = mapper.deleteGuestbook(guestbook);
			
		return cnt;
	}
	
}
