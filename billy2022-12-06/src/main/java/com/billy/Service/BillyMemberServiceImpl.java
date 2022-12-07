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
   public void insertOne(BillyMemberVO bmvo) throws Exception {
      System.out.println(bmvo.getEmail()+"--서비스단insert");
      bmdao.insertOne(bmvo);
      
   }
   @Override
   public int chkId(String id) throws Exception {
      System.out.println(id+"--서비스단id중복");
      return bmdao.chkId(id);
   }

}