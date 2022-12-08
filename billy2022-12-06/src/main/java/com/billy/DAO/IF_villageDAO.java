package com.billy.DAO;

import java.util.List;

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
}
