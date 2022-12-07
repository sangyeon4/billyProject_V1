package com.billy.Service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.billy.DAO.IF_billyMemberDAO;
import com.billy.VO.BillyMemberVO;

@Service
public class BillyMemberServiceImpl implements IF_billyMemberService{

   @Inject
   private IF_billyMemberDAO bmdao;
   @Override
   public void insertMember(BillyMemberVO bmvo) throws Exception {
      System.out.println(bmvo.getEmail()+"--service단 회원가입 디버깅");
      bmdao.insertMember(bmvo);
      
   }
   @Override
   public int chkId(String id) throws Exception {
      System.out.println(id+"--service단 아이디 중복체크");
      return bmdao.chkId(id);
   }

}