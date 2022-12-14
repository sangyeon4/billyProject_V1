package com.billy.Service;

import java.util.List;

import com.billy.VO.BillyGoodsRentVO;
import com.billy.VO.BillyGoodsVO;
import com.billy.VO.BillyGoods_likeVO;

public interface IF_billyService {
	public void insertBilly(BillyGoodsVO bvo) throws Exception;

	public int selectMaxCnt() throws Exception;
	public List<BillyGoodsVO> selectBillyAll()throws Exception;
	public BillyGoodsVO selectBillyOne(String vno) throws Exception;	
	public String selectBillyRentdate(String gNum)throws Exception; //빌리자세히 보기 시 해당글의 이미 대여된 날짜들
	public void updateBilly(BillyGoodsVO bvo) throws Exception;
	public void updateBillyMemberId(String id) throws Exception; //탈퇴 시 처리
	public int selectCntBilly_like(BillyGoods_likeVO blvo) throws Exception;  //좋아요파악
	public void billyLikeUp(BillyGoods_likeVO blvo) throws Exception; //좋아요누르기
	public void billyLikeDown(BillyGoods_likeVO blvo) throws Exception; //좋아요취소
	public void insertBilleyTransaction(BillyGoodsRentVO brvo)throws Exception;//빌리기 대여내역입력
}
