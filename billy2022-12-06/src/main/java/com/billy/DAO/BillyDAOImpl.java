package com.billy.DAO;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.billy.VO.BillyGoodsRentVO;
import com.billy.VO.BillyGoodsVO;
import com.billy.VO.BillyGoods_attachVO;
import com.billy.VO.BillyGoods_likeVO;

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
		System.out.println(bvo.getgNum()+"----DAO단 빌리수정 글번호 디버깅");		
		sqlSession.update(mapperQuery+".updateBilly", bvo);
	
	}

	@Override
	public void updateBillyMemberId(String id) throws Exception {
		System.out.println(id+"----DAO단 탈퇴시 빌리처리 id 디버깅");	
		sqlSession.update(mapperQuery+".updateBillyMemberId", id);		
	}

	@Override
	public int selectCntBilly_like(BillyGoods_likeVO blvo) throws Exception {
		System.out.println(blvo.getgNum()+"----DAO단 빌리자세히보기(좋아요클릭유무) gNum디버깅");
		return sqlSession.selectOne(mapperQuery+".selectCntBilly_like", blvo);
	}

	@Override
	public void billyLikeUp(BillyGoods_likeVO blvo) throws Exception {
		sqlSession.insert(mapperQuery+".billyLikeUp", blvo);
		System.out.println(blvo.getgNum()+"---DAO단 likeUp디버깅");		
	}

	@Override
	public void billyLikeDown(BillyGoods_likeVO blvo) throws Exception {
		sqlSession.delete(mapperQuery+".billyLikeDown", blvo);
		System.out.println(blvo.getgNum()+"---DAO단 likeDown디버깅");				
	}

	@Override
	public String selectOnebilly_name(String vno) throws Exception {
		System.out.println(vno+"----DAO단 selectOne name디버깅");
		return sqlSession.selectOne(mapperQuery+".selectOnebilly_name", vno);
	}

	@Override
	public void insertBilleyTransaction(BillyGoodsRentVO brvo) throws Exception {
		System.out.println(brvo.getId()+"----DAO단 insertBilleyTransaction 디버깅");
		sqlSession.insert(mapperQuery+".insertBillyTransaction", brvo);		
	}

	@Override
	public List<String> selectBillyRentdate(String gNum) throws Exception {
		System.out.println(gNum+"---DAO단 selectBillyRentdate 디버깅 ");
		return sqlSession.selectList(mapperQuery+".selectBillyRentdate", gNum);
	}

	@Override
	public void deleteBillyAttach(BillyGoodsVO bvo) throws Exception {
		System.out.println("---DAO단 deleteBillyAttach 디버깅 ");
		sqlSession.delete(mapperQuery+".deleteBillyAttach", bvo);	
	}

	@Override
	public void updateBillyAttach(Map<String,String> map) throws Exception {
		System.out.println("---DAO단 updateBillyAttach 디버깅 ");
		sqlSession.delete(mapperQuery+".updateBillyAttach", map);	
	}
}