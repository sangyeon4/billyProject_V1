package com.billy.Service;

import java.util.List;

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
		System.out.println("서비스단 시작");
		System.out.println(vvo.getvId()+"서비스단 빌리지 인서트 디버깅");
		villageDao.insertVillage(vvo);
		String [] fname= vvo.getFiles();
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
	public void updateVillageBoardAction(String[] modFile, VillageVO vvo) {
		if(vvo.getFiles()[0] != "") {
			if(modFile.length > 0) {
				//무조건 파일은 1개 , 그파일의 밸류를 받아서 디비와 비교하고 그데이터는 삭제하지 않는다.
			}else {
				//원래글에 파일이 없고 파일을 인서트 하는경우
				//그냥 평소대로 인서트
				villageDao.updateVillageBoard(vvo);
				for (int i = 0; i < vvo.getFiles().length; i++) {
					if (vvo.getFiles()[i] != null) {
						villageDao.updateAttach_v(vvo);
						System.out.println(vvo.getFiles()[i] + "서비스단 빌리지 첨부파일 인서트 디버깅");
					}
				}
			}
		}else {
			if(modFile.length > 0) {
				//전부 삭제후 넘겨받은거 다시 인서트
			}else {
				//파일 업로드도 안하고 원래글에도 파일이 없는경우
				System.out.println("서비스단 빌리지보드 내용만 업데이트 디버깅");
				villageDao.updateVillageBoard(vvo);
			}
		}
	}
}
