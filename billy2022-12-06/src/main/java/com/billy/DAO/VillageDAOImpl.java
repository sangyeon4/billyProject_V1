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
	public void insertVillage(VillageVO vvo) {
		sqlSession.insert(mapperQuery + ".insertVillage",vvo);
		System.out.println(sqlSession.insert(mapperQuery + ".insertVillage",vvo)+"--DAO단 빌리지인서트 디버깅");
		
	}

	@Override
	public List<VillageVO> selectAllVillage() {
		System.out.println(sqlSession.selectList(mapperQuery + ".selectAllVillage")+"--DAO단 빌리지전체보기 디버깅");
		return sqlSession.selectList(mapperQuery + ".selectAllVillage");	
	}

	@Override
	public int selectNum() {
		System.out.println(sqlSession.selectOne(mapperQuery + ".selectNum")+"--DAO단 글번호가져오기 디버깅");
		return sqlSession.selectOne(mapperQuery + ".selectNum");
	
	}

	@Override
	public VillageVO selectOneVillage(int vNum) {
		System.out.println(sqlSession.selectOne(mapperQuery + ".selectOneVillage",vNum)+"--DAO단 글자세히보기 디버깅");
		return sqlSession.selectOne(mapperQuery + ".selectOneVillage",vNum);
	}

}
