package com.billy.DAO;

import java.util.List;

import com.billy.VO.BillyNoticeVO;
import com.billy.VO.VillagePageVO;

public interface IF_billyAdminDAO {

	public int selectBillyNotice();
	
	public void insertBillyNotice(BillyNoticeVO bnvo) throws Exception;
	
	public int selectBillyNoticeCnt();
	
	public List<BillyNoticeVO> selectAllBillyNotice(VillagePageVO vpvo) throws Exception;
	
	public List<BillyNoticeVO> rollingBillyNotice() throws Exception;

	
	
}
