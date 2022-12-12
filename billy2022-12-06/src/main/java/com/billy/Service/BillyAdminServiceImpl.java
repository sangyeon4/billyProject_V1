package com.billy.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.billy.DAO.IF_billyAdminDAO;
import com.billy.DAO.IF_billyMemberDAO;
import com.billy.VO.BillyNoticeVO;
import com.billy.VO.VillagePageVO;

@Service
public class BillyAdminServiceImpl implements IF_billyAdminService{

	@Inject
	private IF_billyAdminDAO badao;

	@Override
	public int selectBillyNotice() {
		System.out.println("--서비스단 공지사항 글번호 가져오기 디버깅");
		return badao.selectBillyNotice();
	}

	@Override
	public void insertBillyNotice(BillyNoticeVO bnvo) throws Exception {
		System.out.println(bnvo.getBnNum()+"--서비스단 공지사항 작성 디버깅");
		badao.insertBillyNotice(bnvo);
		
	}

	@Override
	public int selectBillyNoticeCnt() {
		System.out.println("--서비스단 공지사항 글갯수 가져오기 디버깅");
		return badao.selectBillyNoticeCnt();
	}

	@Override
	public List<BillyNoticeVO> selectAllBillyNotice(VillagePageVO vpvo) throws Exception {
		System.out.println("--서비스단 공지사항 리스트 가져오기 디버깅");
		return badao.selectAllBillyNotice(vpvo);
	}

	@Override
	public List<BillyNoticeVO> rollingBillyNotice() throws Exception {
		System.out.println("--서비스단 공지사항 5개 가져오기");
		return badao.rollingBillyNotice();
	}

	@Override
	public BillyNoticeVO selectOneBillyNotice(int bnNum) throws Exception {
		System.out.println("--서비스단 공지사항 자세히보기");
		return badao.selectOneBillyNotice(bnNum);
	}
	
	
}
