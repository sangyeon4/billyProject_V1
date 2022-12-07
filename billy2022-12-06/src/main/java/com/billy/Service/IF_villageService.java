package com.billy.Service;

import java.util.List;

import com.billy.VO.VillageVO;

public interface IF_villageService {
	
	public void insertVillage(VillageVO vvo);
	
	public List<VillageVO> selectAllVillage();
	
	public int selectNum();
	
	public VillageVO selectOneVillage(int vNum);
	
}
