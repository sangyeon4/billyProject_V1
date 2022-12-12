package com.billy.DAO;

import java.util.List;

import com.billy.VO.BillyGoodsVO;
import com.billy.VO.BillyGoods_attachVO;
import com.billy.VO.BillyGoods_likeVO;

public interface IF_billyDAO {

	public void insertBilly(BillyGoodsVO bvo) throws Exception;
	public void insertAttach(String filename) throws Exception;
	public int selectMaxCnt() throws Exception;
	public List<BillyGoodsVO> selectBillyAll()throws Exception;
	public List<BillyGoods_attachVO> selectBilly_attach()throws Exception;
	public BillyGoodsVO selectBillyOne(String vno)throws Exception;
	public String selectOnebilly_name(String vno) throws Exception;
	public List<BillyGoods_attachVO>selectOneBilly_attach(String vno)throws Exception;
	public void updateBilly(BillyGoodsVO bvo) throws Exception;
	public void updateBillyMemberId(String id) throws Exception; //탈퇴 시 처리	
	public int selectCntBilly_like(BillyGoods_likeVO blvo) throws Exception;  //좋아요파악
	public void billyLikeUp(BillyGoods_likeVO blvo) throws Exception; //좋아요누르기
	public void billyLikeDown(BillyGoods_likeVO blvo) throws Exception; //좋아요취소
}