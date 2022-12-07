package com.billy.DAO;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.billy.VO.BillyMemberVO;

@Repository
public class BillyMemberDAOImpl implements IF_billyMemberDAO {
   
   private static String mapperQuery = "com.billy.DAO.IF_billyMemberDAO";

   @Inject
   private SqlSession sqlSession;
   
   @Override
   public void insertMember(BillyMemberVO bmvo) throws Exception {
      System.out.println(bmvo.getId()+"---dao단 회원가입 디버깅");
      sqlSession.insert(mapperQuery+".insertMember",bmvo);
      
   }

   @Override
   public int chkId(String id) throws Exception {   
      System.out.println(id+"---dao단 id중복체크 디버깅");
      return sqlSession.selectOne(mapperQuery+".chkId",id);
   }
   
}