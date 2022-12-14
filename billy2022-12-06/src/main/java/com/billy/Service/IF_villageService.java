package com.billy.Service;

import java.util.List;

import com.billy.VO.VillagePageVO;
import com.billy.VO.VillageReplyVO;
import com.billy.VO.VillageVO;

public interface IF_villageService {
	
	public void insertVillage(VillageVO vvo) throws Exception;
	
	public void insertAttach_v(String filename);
	
	public List<VillageVO> selectAllVillage(VillagePageVO vpvo);
	
	public int selectNum();
	
	public VillageVO selectOneVillage(int vNum);
	
	public List<String> selectAttach_v(int vNum) throws Exception;
	
	public void insertVillageReply_1(VillageReplyVO vrvo);
	
	public List<VillageReplyVO> selectVillageReply_1(int vNum);
	
	public int selectReplyNum(int vNum);
	
	public void updateVillageCnt(int vNum);
	
	public int selectVillgeBoardCnt();
	
	public void deleteVillageBoard(int vNum);
	
	public void updateVillageBoardMemberId(String id);
	
	public void updateVillageReply_1MemberId(String id);
	
	public void deleteVillageAttach(VillageVO vvo);
	
	public void updateVillageAttach(VillageVO vvo);
	
	public void updateVillageBoard(VillageVO vvo);
	
	public List<VillageVO> selectVillageSearch(VillagePageVO vpvo);
	
	public void deleteVillageReply(int vNum, int r1Num);
	
	public void updateVillageReply(VillageReplyVO vrvo);
	
	//public VillageReplyVO selectVillageReplyOne(VillageReplyVO vrvo);
	
}
