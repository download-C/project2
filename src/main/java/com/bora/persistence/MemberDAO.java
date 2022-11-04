package com.bora.persistence;

import com.bora.domain.MemberVO;

public interface MemberDAO {

	public MemberVO getMember(String id) throws Exception;

	public MemberVO getMemberNick(String nick) throws Exception;

	public int updateMember(MemberVO vo) throws Exception;

	public int deleteMember(String id) throws Exception;


}
