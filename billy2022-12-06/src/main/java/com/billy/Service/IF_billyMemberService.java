package com.billy.Service;

import com.billy.VO.BillyMemberVO;

public interface IF_billyMemberService {
   

   public void insertMember(BillyMemberVO bmvo) throws Exception;
   
   public int chkId(String id) throws Exception;
   
   public int chkName(String name) throws Exception;
   
   public int memberLoginChk(BillyMemberVO bmvo) throws Exception;
   
   public BillyMemberVO myPageInfo(String id) throws Exception;
   
   public void memberInfoUpdate(BillyMemberVO bmvo) throws Exception;
   
   public void deleteMember(String id) throws Exception;
}