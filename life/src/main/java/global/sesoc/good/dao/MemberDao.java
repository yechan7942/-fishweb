package global.sesoc.good.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.good.vo.Member;


@Repository
public class MemberDao {

	@Autowired
	public SqlSession session;
	
	
	public void insertMember(Member mb) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		 
		mapper.insertMember(mb);
		
		}
	
	public Member getMember(String id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		Member vo = mapper.getMember(id);
		return vo;
	}
	public int update(Member member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		int result = 0;
		result = mapper.update(member);
		
		return result;
		}
}
