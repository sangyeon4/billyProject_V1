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
@Override
public int chkName(String name) throws Exception {
	System.out.println(name+"--service단 별명 중복체크");
	return bmdao.chkName(name);
}
@Override
public int memberLoginChk(BillyMemberVO bmvo) throws Exception {
	System.out.println(bmvo.getId()+"--service단 로그인 디버깅");
	return bmdao.memberLoginChk(bmvo);
}

}