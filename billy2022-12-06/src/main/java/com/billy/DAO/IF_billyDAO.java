package com.billy.DAO;

import java.util.List;

import com.billy.VO.BillyGoodsRentVO;
import com.billy.VO.BillyGoodsVO;
import com.billy.VO.BillyGoods_attachVO;
import com.billy.VO.BillyGoods_likeVO;

public interface IF_billyDAO {

	public void insertBilly(BillyGoodsVO bvo) throws Exception; //빌리 등록
	public void insertAttach(String filename) throws Exception; //빌리 등록시 무작위로 만든 파일이름 DB입력
	public int selectMaxCnt() throws Exception; //빌리 등록시 마지막번호를 받아오기위함
	public List<BillyGoodsVO> selectBillyAll()throws Exception; //빌리게시판 전체정보 불러오기
	public List<BillyGoods_attachVO> selectBilly_attach()throws Exception; //빌리게시판 전체 사진불러오기
	public BillyGoodsVO selectBillyOne(String vno)throws Exception; //빌리 자세히보기
	public String selectOnebilly_name(String vno) throws Exception; //빌리자세히 보기 시 해당글의 주인의 이름
	public List<String> selectBillyRentdate(String gNum)throws Exception; //빌리자세히 보기 시 해당글의 이미 대여된 날짜들
	public List<BillyGoods_attachVO>selectOneBilly_attach(String vno)throws Exception;//빌리자세히보기 사진정보 불러오기	
	public void updateBilly(BillyGoodsVO bvo) throws Exception; //빌리게시글 정보수정
	public void updateBillyMemberId(String id) throws Exception; //탈퇴 시 처리	
	public int selectCntBilly_like(BillyGoods_likeVO blvo) throws Exception;  //좋아요파악
	public void billyLikeUp(BillyGoods_likeVO blvo) throws Exception; //좋아요누르기
	public void billyLikeDown(BillyGoods_likeVO blvo) throws Exception; //좋아요취소
	public void insertBilleyTransaction(BillyGoodsRentVO brvo)throws Exception;//빌리기 대여내역입력

	
}