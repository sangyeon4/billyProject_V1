package com.billy.Service;

import com.billy.VO.BillyGoodsVO;


public interface IF_billyService {   
   public void insertOne(BillyGoodsVO bvo) throws Exception;
   public int selectMaxCnt() throws Exception;
}
