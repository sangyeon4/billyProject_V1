package com.billy.Service;

import com.billy.VO.BillyMemberVO;

public interface IF_billyMemberService {
   

   public void insertOne(BillyMemberVO bmvo) throws Exception;
   
   public int chkId(String id) throws Exception;
}