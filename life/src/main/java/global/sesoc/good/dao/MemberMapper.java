package global.sesoc.good.dao;

import global.sesoc.good.vo.Member;

public interface MemberMapper {

	
	public void insertMember(Member mb);
	
	public Member getMember(String id);
	
	public int update(Member member);
}
