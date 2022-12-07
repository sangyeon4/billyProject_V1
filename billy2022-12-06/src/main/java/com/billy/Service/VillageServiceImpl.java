package com.billy.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.billy.DAO.IF_villageDAO;
import com.billy.VO.VillageVO;

@Service
public class VillageServiceImpl implements IF_villageService{

	@Inject
	private IF_villageDAO villageDao;

	@Override
	public void insertOne(VillageVO vvo) {
		villageDao.insertOne(vvo);
	}

	@Override
	public List<VillageVO> selectAll() {
		return villageDao.selectAll();
	}

	@Override
	public int selectNum() {
		return villageDao.selectNum();
	}

	@Override
	public VillageVO selectOne(int vNum) {
		return villageDao.selectOne(vNum);
	}

}
