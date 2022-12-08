package com.billy.DAO;

import java.util.List;

import com.billy.VO.VillageVO;

public interface IF_villageDAO {
	
	public void insertVillage(VillageVO vvo);
	
	public void insertAttach_v(String filename);
	
	public List<VillageVO> selectAllVillage();
	
	public int selectNum();
	
	public VillageVO selectOneVillage(int vNum);
	
	public List<String> selectAttach_v(int vNum) throws Exception;
}
