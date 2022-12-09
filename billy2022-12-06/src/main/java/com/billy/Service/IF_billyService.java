package com.billy.Service;

import java.util.List;

import com.billy.VO.BillyGoodsVO;

public interface IF_billyService {
	public void insertBilly(BillyGoodsVO bvo) throws Exception;

	public int selectMaxCnt() throws Exception;
	public List<BillyGoodsVO> selectBillyAll();
	public BillyGoodsVO selectBillyOne(String vno);
}
