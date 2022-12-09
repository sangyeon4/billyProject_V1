package com.billy.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.billy.VO.BillyGoodsVO;
import com.billy.VO.BillyGoods_attachVO;

@Repository
public class BillyDAOImpl implements IF_billyDAO {

	private static String mapperQuery = "com.billy.DAO.IF_billyDAO";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertBilly(BillyGoodsVO bvo) throws Exception {
		sqlSession.insert(mapperQuery + ".insertBilly", bvo); // billy맵핑
		System.out.println(bvo.getId() + "-------DAO(billy등록 디버깅)");
	}

	@Override
	public int selectMaxCnt() throws Exception {
		System.out.println(sqlSession.selectOne(mapperQuery + ".selectMaxCnt") + "-------DAO(글번호마지막 디버깅)");
		return sqlSession.selectOne(mapperQuery + ".selectMaxCnt");
	}

	@Override
	public void insertAttach(String filename) throws Exception {
		sqlSession.insert(mapperQuery + ".billy_attach", filename);
		System.out.println(filename + "-------DAO(파일네임 디버깅)");
	}

	@Override
	public List<BillyGoodsVO> selectBillyAll() {
		System.out.println(sqlSession.selectList(mapperQuery+".selectAllBilly")+"---DAO 빌리전체보기 디버깅");		
		return sqlSession.selectList(mapperQuery+".selectAllBilly");
	}

	@Override
	public List<BillyGoods_attachVO> selectBilly_attach() {
		System.out.println(sqlSession.selectList(mapperQuery+".selectAllBilly_attach")+"DAO단 All빌리첨부파일 디버깅");		
		return sqlSession.selectList(mapperQuery+".selectAllBilly_attach");
	}
	

	@Override
	public BillyGoodsVO selectBillyOne(String vno) {
	System.out.println(sqlSession.selectOne(mapperQuery+".selectOneBilly", vno)+"DAO단 빌리자세히보기 디버깅");
		return sqlSession.selectOne(mapperQuery+".selectOneBilly", vno);
	}


	@Override
	public List<BillyGoods_attachVO> selectOneBilly_attach(String vno) {
		System.out.println(vno+"----DAO단 빌리자세히보기(파일)글번호값 디버깅");
		return sqlSession.selectList(mapperQuery+".selectOneBilly_attach",vno);
	}

	@Override
	public void updateBilly(BillyGoodsVO bvo) throws Exception {
		sqlSession.update(mapperQuery+".updateBilly", bvo);
		System.out.println(bvo.getgNum()+"----DAO단 빌리수정 글번호 디버깅");
		
	}
}
