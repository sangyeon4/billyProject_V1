package com.billy.DAO;

import java.util.List;
import java.util.Map;

import com.billy.VO.VillagePageVO;
import com.billy.VO.VillageReplyVO;
import com.billy.VO.VillageVO;

public interface IF_villageDAO {
	
	public void insertVillage(VillageVO vvo);
	
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
	
	public void updateVillageAttach(Map<String,String> map);
	
	public void updateVillageBoard(VillageVO vvo);
	
	public List<VillageVO> selectVillageTitle(VillagePageVO vpvo);
	
	public List<VillageVO> selectVillageTitleText(VillagePageVO vpvo);
	
	public List<VillageVO> selectVillageWriter(VillagePageVO vpvo);
	
}
