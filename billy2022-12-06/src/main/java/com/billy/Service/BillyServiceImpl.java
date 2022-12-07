package com.billy.Service;

import javax.inject.Inject;


import org.springframework.stereotype.Service;

import com.billy.DAO.IF_billyDAO;
import com.billy.VO.BillyGoodsVO;

@Service
public class BillyServiceImpl implements IF_billyService {
   
   @Inject   
   private IF_billyDAO billyDao;

   @Override
   public void insertBilly(BillyGoodsVO bvo) throws Exception { 
      billyDao.insertBilly(bvo);   
      System.out.println(bvo.getId()+"-------service단 빌리등록 디버깅");
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
      System.out.println(billyDao.selectMaxCnt()+"---service 빌리 글번호 디버깅");
      return billyDao.selectMaxCnt()+1; //DB에서 가져온 값에서 +1
   }

}
