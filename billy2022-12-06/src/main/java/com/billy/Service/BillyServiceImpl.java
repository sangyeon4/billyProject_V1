package com.billy.Service;

import javax.inject.Inject;


import org.springframework.stereotype.Service;

import com.billy.DAO.IF_billyDAO;
import com.billy.VO.BillyGoodsVO;

@Service
public class BillyServiceImpl implements IF_billyService {
   
   @Inject   //나 dao단이 필요해 주입해줘
   private IF_billyDAO billyDao;

   @Override
   public void insertOne(BillyGoodsVO bvo) throws Exception { //빌리등록
      billyDao.insertOne(bvo);   
      System.out.println(bvo.getId()+"-------service디버깅");
      String [] fname= bvo.getFiles();
      if(fname != null) {
         for(int i = 0 ; i < fname.length; i++) {
            if(fname[i]!=null) {
               billyDao.insertAttach(fname[i]);
            }            
         }
      }
      
   }

   @Override
   public int selectMaxCnt() throws Exception {
      System.out.println(billyDao.selectMaxCnt()+"---service디버깅");
      return billyDao.selectMaxCnt()+1; //마지막 글번호에서 +1
   }

}
