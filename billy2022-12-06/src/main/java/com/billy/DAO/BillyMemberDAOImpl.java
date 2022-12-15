package com.billy.DAO;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.billy.VO.BillyGoodsRentVO;
import com.billy.VO.BillyGoodsVO;
import com.billy.VO.BillyMemberVO;

@Repository
public class BillyMemberDAOImpl implements IF_billyMemberDAO {

	private static String mapperQuery = "com.billy.DAO.IF_billyMemberDAO";

	@Inject
	private SqlSession sqlSession;

	@Override
	public void insertMember(BillyMemberVO bmvo) throws Exception {
		System.out.println(bmvo.getId() + "---dao단 회원가입 디버깅");
		sqlSession.insert(mapperQuery + ".insertMember", bmvo);

	}

	@Override
	public int chkId(String id) throws Exception {
		System.out.println(id + "---dao단 id중복체크 디버깅");
		return sqlSession.selectOne(mapperQuery + ".chkId", id);
	}

	@Override
	public int chkName(String name) throws Exception {
		System.out.println(name + "---dao단 별명중복체크 디버깅");
		return sqlSession.selectOne(mapperQuery + ".chkName", name);
	}

	@Override
	public int memberLoginChk(BillyMemberVO bmvo) throws Exception {
		System.out.println(bmvo.getPwd()+"--dao단 로그인 디버깅");
		return sqlSession.selectOne(mapperQuery+".memberLoginChk",bmvo);
	}

	@Override
	public BillyMemberVO myPageInfo(String id) throws Exception {
		System.out.println(id+"--dao단 내정보보기 디버깅");
		return sqlSession.selectOne(mapperQuery+".myPageInfo",id);
	}

	@Override
	public void memberInfoUpdate(BillyMemberVO bmvo) throws Exception {
		System.out.println(bmvo.getId()+"--dao단 내정보수정 디버깅");
		sqlSession.insert(mapperQuery+".memberInfoUpdate",bmvo);
		
	}

	@Override
	public void deleteMember(String id) throws Exception {
		System.out.println(id+"--dao단 탈퇴 디버깅");
		sqlSession.insert(mapperQuery+".deleteMember",id);
		
	}

	@Override
	public int updateMailKey(BillyMemberVO bmvo) throws Exception {
		System.out.println(bmvo.getId()+"--dao단 이메일 인증키 디버깅");
		return sqlSession.update(mapperQuery + ".updateMailKey", bmvo);
	}

	@Override
	public int updateMailAuth(BillyMemberVO bmvo) throws Exception {
		System.out.println(bmvo.getMailKey()+"--dao단 이메일 인증받았으면 0>1로 바뀌는기능 디버깅");
		return sqlSession.update(mapperQuery + ".updateMailAuth", bmvo);
	}

	@Override
	public int emailAuthFail(String id) throws Exception {
		System.out.println(id+"--dao단 회원가입시 이메일 인증여부 체크 디버깅");
		return sqlSession.selectOne(mapperQuery + ".emailAuthFail", id);
	}

	@Override
	public void pwdModAction(BillyMemberVO bmvo) throws Exception {
		System.out.println(bmvo.getId()+"--dao단 비밀번호 변경 디버깅");
		sqlSession.update(mapperQuery+".pwdModAction",bmvo);
		
	}

	@Override
	public List<BillyGoodsVO> myBookmarkList(String id) throws Exception {
		System.out.println(id+"--dao단 찜목록불러오기 디버깅");
		return sqlSession.selectList(mapperQuery+".selectMyBookmarkList",id);
	}

	@Override
	public List<BillyGoodsVO> selectMyBillyGoods(String id) throws Exception {
		System.out.println(id+"--dao단 내가 등록한 빌리");
		return sqlSession.selectList(mapperQuery+".selectMyBillyGoods",id);
	}

	@Override
	public List<BillyGoodsRentVO> selectMyBillyTransactionList(String id) throws Exception {
		System.out.println(id+"--dao단 내가 빌린 빌리");
		return sqlSession.selectList(mapperQuery+".selectMyBillyTransactionList",id);
	}

}