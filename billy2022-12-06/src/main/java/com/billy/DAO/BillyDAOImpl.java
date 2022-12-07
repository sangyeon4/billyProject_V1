package com.billy.DAO;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.billy.VO.BillyGoodsVO;

@Repository
public class BillyDAOImpl implements IF_billyDAO{

   private static String mapperQuery = "com.billy.DAO.IF_billyDAO";
   
   @Inject   
   private SqlSession sqlSession;
   
   @Override
   public void insertBilly(BillyGoodsVO bvo) throws Exception {
      sqlSession.insert(mapperQuery + ".insertBilly",bvo); //billy맵핑
      System.out.println(bvo.getId()+"-------DAO(billy등록 디버깅)");
   }

   @Override
   public int selectMaxCnt() throws Exception { 
      System.out.println(sqlSession.selectOne(mapperQuery+".selectMaxCnt")+"-------DAO(글번호마지막 디버깅)");
      return sqlSession.selectOne(mapperQuery+".selectMaxCnt");
   }

   @Override
   public void insertAttach(String filename) throws Exception {
      sqlSession.insert(mapperQuery+".billy_attach",filename);      
      System.out.println(sqlSession.insert(mapperQuery+".billy_attach",filename)+"-------DAO(파일네임 디버깅)");
   }

}
