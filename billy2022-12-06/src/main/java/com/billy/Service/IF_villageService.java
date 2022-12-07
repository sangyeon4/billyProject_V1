package com.billy.Service;

import java.util.List;

import com.billy.VO.VillageVO;

public interface IF_villageService {
	
	public void insertOne(VillageVO vvo);
	
	public List<VillageVO> selectAll();
	
	public int selectNum();
	
	public VillageVO selectOne(int vNum);
	
}
