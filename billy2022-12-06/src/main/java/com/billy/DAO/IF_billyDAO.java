package com.billy.DAO;



import com.billy.VO.BillyGoodsVO;

public interface IF_billyDAO {
   

   
   public void insertOne(BillyGoodsVO bvo) throws Exception;
   public void insertAttach(String filename) throws Exception;
   public int selectMaxCnt() throws Exception;

}