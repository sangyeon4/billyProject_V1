package com.billy.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.billy.VO.VillageVO;

@Repository
public class VillageDAOImpl implements IF_villageDAO {
	
	private static String mapperQuery = "com.billy.DAO.IF_villageDAO";
	
	@Inject	
	private SqlSession sqlSession;

	@Override
	public void insertOne(VillageVO vvo) {
		sqlSession.insert(mapperQuery + ".insertOne",vvo);
	}

	@Override
	public List<VillageVO> selectAll() {
		return sqlSession.selectList(mapperQuery + ".selectAll");
	}

	@Override
	public int selectNum() {
		return sqlSession.selectOne(mapperQuery + ".selectNum");
	}

	@Override
	public VillageVO selectOne(int vNum) {
		return sqlSession.selectOne(mapperQuery + ".selectOne",vNum);
	}

}
