package com.billy.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.billy.VO.BillyNoticeVO;
import com.billy.VO.VillagePageVO;

@Repository
public class BillyAdminDAOImpl implements IF_billyAdminDAO{

	private static String mapperQuery = "com.billy.DAO.IF_billyAdminDAO";

	@Inject
	private SqlSession sqlSession;

	@Override
	public int selectBillyNotice() {
		return sqlSession.selectOne(mapperQuery + ".selectBillyNotice");
	}

	@Override
	public void insertBillyNotice(BillyNoticeVO bnvo) throws Exception {
		sqlSession.insert(mapperQuery + ".insertBillyNotice",bnvo);
	}

	@Override
	public int selectBillyNoticeCnt() {
		return sqlSession.selectOne(mapperQuery + ".selectBillyNoticeCnt");
	}

	@Override
	public List<BillyNoticeVO> selectAllBillyNotice(VillagePageVO vpvo) throws Exception {
		return sqlSession.selectList(mapperQuery + ".selectAllBillyNotice",vpvo);
	}

	@Override
	public List<BillyNoticeVO> rollingBillyNotice() throws Exception {
		return sqlSession.selectList(mapperQuery + ".rollingBillyNotice");
	}

	@Override
	public BillyNoticeVO selectOneBillyNotice(String bnNum) throws Exception {
		return sqlSession.selectOne(mapperQuery + ".selectOneBillyNotice",bnNum);
	}
	
}
