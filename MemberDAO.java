package com.myweb.dao;

import com.myweb.vo.MemberVO;

public class MemberDAO extends DBConn{
	// select : �α���ó��
	public int getLogin(MemberVO vo) {
		int result = 0;
		String sql = "SELECT COUNT(*) FROM MEMBER WHERE ID = ? AND PASS = ?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = rs.getInt(1);
			}
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// insert : ȸ������
	public int insert(MemberVO vo) {
		int result = 0;
		//String sql = "insert into member values('" 
		//		+ vo.getId() + "','"
		//		+ vo.getName() + "','"
		//		+ vo.getAddr() + "','" 
		//		+ vo.getHp() + "',sysdate,'"
		//		+ vo.getPass() + "')";
		
		String sql = "insert into member values(?,?,?,?,sysdate,?)";
		
		//getStatement();
		getPreparedStatement(sql);
		
		try {
			//pstmt�� �����ϴ� �����ͳֱ�
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getAddr());
			pstmt.setString(4, vo.getHp());
			pstmt.setString(5, vo.getPass());
			
			//result = stmt.executeUpdate(sql);
			result = pstmt.executeUpdate();
			close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}// class
