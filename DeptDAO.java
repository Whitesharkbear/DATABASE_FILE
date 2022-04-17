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
      getStatement(); // DBConn�� stmt ��ü ���� �޼ҵ�
      
      // 6. ResultSet ��ü���� ������ ��������
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
