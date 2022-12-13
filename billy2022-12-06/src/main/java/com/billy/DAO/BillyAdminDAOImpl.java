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
		System.out.println("--dao단 공지사항 글번호 가져오기 디버깅");
		return sqlSession.selectOne(mapperQuery + ".selectBillyNotice");
	}

	@Override
	public void insertBillyNotice(BillyNoticeVO bnvo) throws Exception {
		System.out.println(bnvo.getBnNum()+"--dao단 공지사항작성 디버깅");
		sqlSession.insert(mapperQuery + ".insertBillyNotice",bnvo);
	}

	@Override
	public int selectBillyNoticeCnt() {
		System.out.println("--dao단 공지사항 글 갯수 가져오기 디버깅");
		return sqlSession.selectOne(mapperQuery + ".selectBillyNoticeCnt");
	}

	@Override
	public List<BillyNoticeVO> selectAllBillyNotice(VillagePageVO vpvo) throws Exception {
		System.out.println("--dao단 공지사항 리스트 가져오기 디버깅");
		return sqlSession.selectList(mapperQuery + ".selectAllBillyNotice",vpvo);
	}

	@Override
	public List<BillyNoticeVO> rollingBillyNotice() throws Exception {
		System.out.println("--dao단 공지사항 5개만 가져오기 디버깅");
		return sqlSession.selectList(mapperQuery + ".rollingBillyNotice");
	}

	@Override
	public BillyNoticeVO selectOneBillyNotice(String bnNum) throws Exception {
		System.out.println(bnNum+"--dao단 공지사항 자세히보기 디버깅");
		return sqlSession.selectOne(mapperQuery + ".selectOneBillyNotice",bnNum);
	}
	
}
