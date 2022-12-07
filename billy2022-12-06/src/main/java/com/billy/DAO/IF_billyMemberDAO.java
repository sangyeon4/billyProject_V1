package com.billy.DAO;

import com.billy.VO.BillyMemberVO;

public interface IF_billyMemberDAO {

   public void insertOne(BillyMemberVO bmvo) throws Exception;
   
   public int chkId(String id) throws Exception;
}