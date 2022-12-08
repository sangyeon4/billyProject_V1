package com.billy.Service;

import java.util.List;

import com.billy.VO.VillageVO;

public interface IF_villageService {
	
	public void insertVillage(VillageVO vvo) throws Exception;
	
	public void insertAttach_v(String filename);
	
	public List<VillageVO> selectAllVillage();
	
	public int selectNum();
	
	public VillageVO selectOneVillage(int vNum);
	
	public List<String> selectAttach_v(int vNum) throws Exception;
	
}
