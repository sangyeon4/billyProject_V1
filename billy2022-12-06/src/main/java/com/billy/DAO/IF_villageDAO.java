package com.billy.DAO;

import java.util.List;

import com.billy.VO.VillageVO;

public interface IF_villageDAO {
	
	public void insertOne(VillageVO vvo);
	
	public List<VillageVO> selectAll();
	
	public int selectNum();
	
	public VillageVO selectOne(int vNum);
}
