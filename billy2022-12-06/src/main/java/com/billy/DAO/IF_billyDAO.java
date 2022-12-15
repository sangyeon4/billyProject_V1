package com.billy.DAO;

import java.util.List;
import java.util.Map;

import com.billy.VO.BillyGoodsAttachVO;
import com.billy.VO.BillyGoodsLikeVO;
import com.billy.VO.BillyGoodsRentVO;
import com.billy.VO.BillyGoodsVO;

public interface IF_billyDAO {

	public void insertBilly(BillyGoodsVO bvo) throws Exception; //빌리 등록
	public void insertAttach(String filename) throws Exception; //빌리 등록시 무작위로 만든 파일이름 DB입력
	public int selectMaxCnt() throws Exception; //빌리 등록시 마지막번호를 받아오기위함
	public List<BillyGoodsVO> selectBillyAll()throws Exception; //빌리게시판 전체정보 불러오기
	public List<BillyGoodsAttachVO> selectBillyAttach()throws Exception; //빌리게시판 전체 사진불러오기
	public BillyGoodsVO selectBillyOne(String vno)throws Exception; //빌리 자세히보기
	public String selectOnebillyName(String vno) throws Exception; //빌리자세히 보기 시 해당글의 주인의 이름	
	public void deleteBillyAttachGnun(String vno)throws Exception; //빌리 삭제 시  해당글의 첨부파일삭제
	public void updateBillyTransactionNo_1(String vno)throws Exception; //빌리 삭제 시  트랜잭션의 글번호를 0번으로 수정	
	public void deleteBillyGoods(String vno)throws Exception; //빌리 삭제
	public List<String> selectBillyRentdate(String gNum)throws Exception; //빌리자세히 보기 시 해당글의 이미 대여된 날짜들
	public List<BillyGoodsAttachVO>selectOneBillyAttach(String vno)throws Exception;//빌리자세히보기 사진정보 불러오기	
	public void updateBilly(BillyGoodsVO bvo) throws Exception; //빌리게시글 정보수정
	public void updateBillyMemberId(String id) throws Exception; //탈퇴 시 처리	
	public int selectCntBillyLike(BillyGoodsLikeVO blvo) throws Exception;  //좋아요파악
	public void billyLikeUp(BillyGoodsLikeVO blvo) throws Exception; //좋아요누르기
	public void billyLikeDown(BillyGoodsLikeVO blvo) throws Exception; //좋아요취소
	public void insertBilleyTransaction(BillyGoodsRentVO brvo)throws Exception;//빌리기 대여내역입력	
	public void deleteBillyAttach(BillyGoodsVO bvo)throws Exception;//빌리 첨부파일 삭제
	public void updateBillyAttach(Map<String,String> map)throws Exception;//빌리 첨부파일 업데이트
}