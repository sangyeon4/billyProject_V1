package com.billy.Service;

import java.util.List;

import com.billy.VO.BillyGoodsAttachVO;
import com.billy.VO.BillyGoodsLikeVO;
import com.billy.VO.BillyGoodsRentVO;
import com.billy.VO.BillyGoodsVO;

public interface IF_billyService {
	public void insertBilly(BillyGoodsVO bvo) throws Exception; //빌리등록
	public int selectMaxCnt() throws Exception; //빌리마지막 글번호받아오기
	public List<BillyGoodsVO> selectBillyAll()throws Exception; //빌리전체글 받아오기 + 파일1개씩 받아오기
	public BillyGoodsVO selectBillyOne(String vno) throws Exception; //빌리 자세히 보기
	public String selectBillyRentdate(String gNum)throws Exception; //빌리자세히 보기 시 해당글의 이미 대여된 날짜들
	public void updateBilly(BillyGoodsVO bvo) throws Exception; //빌리 수정
	public void updateBillyMemberId(String id) throws Exception; //탈퇴 시 처리
	public void deleteBillyOne(String vno)throws Exception; //빌리 삭제
	public int selectCntBillyLike(BillyGoodsLikeVO blvo) throws Exception;  //좋아요파악
	public void billyLikeUp(BillyGoodsLikeVO blvo) throws Exception; //좋아요누르기
	public void billyLikeDown(BillyGoodsLikeVO blvo) throws Exception; //좋아요취소
	public void insertBilleyTransaction(BillyGoodsRentVO brvo)throws Exception;//빌리기 대여내역입력
	public List<BillyGoodsAttachVO> selectOneBillyAttach(String vno)throws Exception;
	public void deleteBillyAttach(BillyGoodsVO bvo)throws Exception;//빌리 첨부파일 삭제
	public void updateBillyAttach(BillyGoodsVO bvo)throws Exception;//빌리 첨부파일 업데이트
}
