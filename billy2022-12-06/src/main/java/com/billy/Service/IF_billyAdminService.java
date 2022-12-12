package com.billy.Service;

import java.util.List;

import com.billy.VO.BillyNoticeVO;
import com.billy.VO.VillagePageVO;

public interface IF_billyAdminService {

	public int selectBillyNotice();
	
	public void insertBillyNotice(BillyNoticeVO bnvo) throws Exception;
	
	public int selectBillyNoticeCnt();
	
	public List<BillyNoticeVO> selectAllBillyNotice(VillagePageVO vpvo)throws Exception;
	
	public List<BillyNoticeVO> rollingBillyNotice()throws Exception;

	
}
