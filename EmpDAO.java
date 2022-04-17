package com.myweb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.myweb.vo.DeptVO;
import com.myweb.vo.EmpVO;

public class EmpDAO extends DBConn {
   //Field
   //Constructor
   //Method
	public EmpVO getContent(String empno) {
		EmpVO vo = new EmpVO();
		String sql = "select empno, ename, job, hiredate, sal, comm, deptno from emp where empno=?";
		getPreparedStatement(sql);
		
		try {
			pstmt.setString(1, empno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setEmpno(rs.getInt(1));
				vo.setEname(rs.getString(2));
				vo.setJob(rs.getString(3));
				vo.setHiredate(rs.getString(4));
				vo.setSal(rs.getInt(5));
				vo.setComm(rs.getInt(6));
				vo.setDeptno(rs.getInt(7));
			
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}

   public ArrayList<EmpVO> getList() {
      ArrayList<EmpVO> list = new ArrayList<EmpVO>();
      String sql = "select * from emp";
      getStatement();
      // 6. ResultSet 객체에서 데이터 꺼내오기
      try {
    	  
    	  rs = stmt.executeQuery(sql);
    	  
         while(rs.next()) {
            EmpVO vo = new EmpVO();
            vo.setEmpno(rs.getInt(1));
            vo.setEname(rs.getString(2));
            vo.setJob(rs.getString(3));
            vo.setMgr(rs.getInt(4));
            vo.setHiredate(rs.getString(5));
            vo.setSal(rs.getDouble(6));
            vo.setComm(rs.getDouble(7));
            vo.setDeptno(rs.getInt(8));
            
            list.add(vo);
         }
         close();
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return list;   
   }  
}
