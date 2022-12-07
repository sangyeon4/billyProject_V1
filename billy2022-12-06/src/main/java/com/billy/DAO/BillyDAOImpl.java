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
   public void insertOne(BillyGoodsVO bvo) throws Exception {
      sqlSession.insert(mapperQuery + ".insertOne",bvo); //쿼리 매핑 및 실행
      System.out.println(bvo.getId()+"-------DAO디버깅");
   }

   @Override
   public int selectMaxCnt() throws Exception { //마지막 글 번호불러오기
      System.out.println(sqlSession.selectOne(mapperQuery+".selectMaxCnt")+"---DAO디버깅(글번호)");
      return sqlSession.selectOne(mapperQuery+".selectMaxCnt");
   }

   @Override
   public void insertAttach(String filename) throws Exception {
      sqlSession.insert(mapperQuery+".billy_attach",filename);      
      
   }

}
