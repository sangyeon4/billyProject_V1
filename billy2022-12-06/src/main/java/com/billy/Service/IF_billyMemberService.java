package com.billy.Service;

import com.billy.VO.BillyMemberVO;

public interface IF_billyMemberService {
   

   public void insertMember(BillyMemberVO bmvo) throws Exception;
   
   public int chkId(String id) throws Exception;
   
   public int chkName(String name) throws Exception;
   
   public int memberLoginChk(BillyMemberVO bmvo) throws Exception;
   
   public BillyMemberVO myPageInfo(String id) throws Exception;
   
   public void memberInfoUpdate(BillyMemberVO bmvo) throws Exception;
   
   public void pwdModAction(BillyMemberVO bmvo) throws Exception;
   
   public void deleteMember(String id) throws Exception;
   
   //회원 가입시 이메일 인증을 위한 랜덤번호 저장
   public int updateMailKey(BillyMemberVO bmvo) throws Exception;
   
   //메일 인증을 하면 mail_auth 컬럼을 기본값 0에서 1로 바꿔 로그인을 허용
   public int updateMailAuth(BillyMemberVO bmvo) throws Exception;
  
   //이메일 인증을 안 했으면 0을 반환, 로그인 시 인증했나 안 했나 체크하기 위함
   public int emailAuthFail(String id) throws Exception; 
   
   //비밀번호 찾기용 이메일 인증키 발송
   public void pwdSearchEmailSend(BillyMemberVO bmvo) throws Exception;
   
   
}