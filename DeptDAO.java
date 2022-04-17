package com.myweb.dao;

import java.util.ArrayList;
import com.myweb.vo.DeptVO;

public class DeptDAO extends DBConn {
   // Feild
   // Constructor
   // Method
   public ArrayList<DeptVO> getList() {
      ArrayList<DeptVO> list = new ArrayList<DeptVO>();
      String sql = "select * from dept";
      getStatement(); // DBConn의 stmt 객체 생성 메소드
      
      // 6. ResultSet 객체에서 데이터 꺼내오기
      try {
    	  
    	  rs = stmt.executeQuery(sql);
    	  
         while(rs.next()) {
            DeptVO vo = new DeptVO();
            vo.setDeptno(rs.getInt(1));
            vo.setDname(rs.getString(2));
            vo.setLoc(rs.getString(3));
            
            list.add(vo);
         }
         close();
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return list;
      
   }  
}
