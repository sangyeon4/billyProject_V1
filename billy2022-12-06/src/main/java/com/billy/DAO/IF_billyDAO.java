package com.billy.DAO;

import java.util.List;

import com.billy.VO.BillyGoodsVO;
import com.billy.VO.BillyGoods_attachVO;

public interface IF_billyDAO {

	public void insertBilly(BillyGoodsVO bvo) throws Exception;
	public void insertAttach(String filename) throws Exception;
	public int selectMaxCnt() throws Exception;
	public List<BillyGoodsVO> selectBillyAll();
	public List<BillyGoods_attachVO> selectBilly_attach();
	public BillyGoodsVO selectBillyOne(String vno);
	public List<BillyGoods_attachVO>selectOneBilly_attach(String vno);
}