package com.billy.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.billy.DAO.IF_villageDAO;
import com.billy.VO.VillagePageVO;
import com.billy.VO.VillageReplyVO;
import com.billy.VO.VillageVO;

@Service
public class VillageServiceImpl implements IF_villageService{

	@Inject
	private IF_villageDAO villageDao;

	@Override
	public void insertVillage(VillageVO vvo) throws Exception {
		villageDao.insertVillage(vvo);
		String [] fname= vvo.getFiles(); //파일을 랜덤이름으로 변환 후 하드에 저장하고 배열에 저장
		System.out.println(fname+"파일이름");
		if(fname != null) {
	         for(int i = 0 ; i < fname.length; i++) {
	            if(fname[i]!=null) {
	               villageDao.insertAttach_v(fname[i]);
	               System.out.println(fname[i]+"서비스단 빌리지 첨부파일 인서트 디버깅");
	            }            
	         }
	      }
	}

	@Override
	public void insertAttach_v(String filename) {
		villageDao.insertAttach_v(filename);
		System.out.println(filename+"서비스단 파일이름 디버깅");
	}
	
	@Override
	public List<VillageVO> selectAllVillage(VillagePageVO vpvo) {
		System.out.println("서비스단 빌리지 리스트 디버깅");
		return villageDao.selectAllVillage(vpvo);
	}

	@Override
	public int selectNum() {
		System.out.println("서비스단 빌리지 넘버 디버깅");
		return villageDao.selectNum();
	}

	@Override
	public VillageVO selectOneVillage(int vNum) {
		System.out.println(vNum+"서비스단 빌리지 자세히보기 디버깅");
		return villageDao.selectOneVillage(vNum);
	}

	@Override
	public List<String> selectAttach_v(int vNum) throws Exception {
		System.out.println(vNum+"서비스단 첨부파일 자세히보기 디버깅");
		return villageDao.selectAttach_v(vNum);
	}

	@Override
	public void insertVillageReply_1(VillageReplyVO vrvo) {
		villageDao.insertVillageReply_1(vrvo);
		System.out.println("서비스단 빌리지 댓글 1 인서트 디버깅");
	}

	@Override
	public List<VillageReplyVO> selectVillageReply_1(int vNum) {
		System.out.println("서비스단 빌리지 댓글 1 셀렉트 디버깅");
		return villageDao.selectVillageReply_1(vNum);
	}

	@Override
	public int selectReplyNum(int vNum) {
		System.out.println("서비스단 빌리지 댓글 1 넘버 셀렉트 디버깅");
		return villageDao.selectReplyNum(vNum);
	}

	@Override
	public void updateVillageCnt(int vNum) {
		villageDao.updateVillageCnt(vNum);
		System.out.println("서비스단 빌리지 조회수 업데이트 디버깅");
	}

	@Override
	public int selectVillgeBoardCnt() {
		System.out.println("서비스단 빌리지 개수 셀렉트 디버깅");
		return villageDao.selectVillgeBoardCnt();
	}

	@Override
	public void deleteVillageBoard(int vNum) {
		villageDao.deleteVillageBoard(vNum);
		System.out.println("서비스단 빌리지 삭제 디버깅");
	}

	@Override
	public void updateVillageBoardMemberId(String id) {
		villageDao.updateVillageBoardMemberId(id);
		System.out.println("서비스단 회원탈퇴 빌리지 업데이트 디버깅");
	}

	@Override
	public void updateVillageReply_1MemberId(String id) {
		villageDao.updateVillageReply_1MemberId(id);
		System.out.println("서비스단 회원탈퇴 빌리지 댓글 업데이트 디버깅");
	}
	
	@Override
	public void updateVillageBoard(VillageVO vvo) {
		villageDao.updateVillageBoard(vvo);
		System.out.println("서비스단  빌리지 게시글 업데이트 디버깅");
	}

	@Override
	public void deleteVillageAttach(VillageVO vvo) {
		villageDao.deleteVillageAttach(vvo);
		System.out.println("서비스단 빌리지 첨부파일 삭제 디버깅");
	}

	@Override
	public void updateVillageAttach(VillageVO vvo) {
		Map<String, String> map = new HashMap<>();
		for (int i = 0; i < vvo.getFiles().length; i++) {
			String file = vvo.getFiles()[i];
			System.out.println(file);
			String num = Integer.toString(vvo.getvNum());
			System.out.println(num);
			map.put("vNum" + i, num);
			map.put("file" + i, file);
		}
		villageDao.updateVillageAttach(map);
	}

	@Override
	public List<VillageVO> selectVillageSearch(VillagePageVO vpvo) {
		System.out.println("서비스단 검색 디버깅");
		String searchOption = vpvo.getSearchOption();
		if(searchOption.equals("title")) {
			return villageDao.selectVillageTitle(vpvo);
		}else if(searchOption.equals("titleText")) {
			return villageDao.selectVillageTitleText(vpvo);
		}else if(searchOption.equals("writer")) {
			return villageDao.selectVillageWriter(vpvo);
		}
		return null;
	}

	@Override
	public void deleteVillageReply(int vNum, int r1Num) {
		System.out.println("서비스단 댓글 삭제 디버깅");
		Map<String, String> map = new HashMap<>();
		map.put("vNum",Integer.toString(vNum));
		map.put("r1Num",Integer.toString(r1Num));
		villageDao.deleteVillageReply(map);
	}

	@Override
	public void updateVillageReply(VillageReplyVO vrvo) {
		System.out.println("서비스단 댓글 업데이트 디버깅");
		villageDao.updateVillageReply(vrvo);
	}

	/*
	 * @Override public VillageReplyVO selectVillageReplyOne(VillageReplyVO vrvo) {
	 * System.out.println("서비스단 댓글 하나 검색 디버깅"); return
	 * villageDao.selectVillageReplyOne(vrvo); }
	 */

}

