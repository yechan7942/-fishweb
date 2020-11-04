package global.sesoc.good.dao;

import java.util.ArrayList;

import global.sesoc.good.vo.GuestBook;

public interface GuestBookMapper {

	public int insertGuestbook(GuestBook guestbook);
	
	public ArrayList<GuestBook> list();
	
	public int deleteGuestbook(GuestBook guestbook);
}
