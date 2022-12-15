package com.billy.Service;

import java.util.List;

import com.billy.VO.VillagePageVO;
import com.billy.VO.VillageReplyVO;
import com.billy.VO.VillageVO;

public interface IF_villageService {
	
	//게시글 삽입 메서드
	public void insertVillage(VillageVO vvo) throws Exception;
	
	//게시글 첨부파일 삽입 메서드
	public void insertAttach_v(String filename);
	
	//게시글 전체 검색 리턴 메서드
	public List<VillageVO> selectAllVillage(VillagePageVO vpvo);
	
	//게시글 제일 마지막 번호 리턴 메서드
	public int selectNum();
	
	//글번호로 게시글 검색 후 하나의 정보를 리턴하는 메서드
	public VillageVO selectOneVillage(int vNum);
	
	//게시글 번호로 첨부파일 검색 후 리스트를 리턴하는 메서드
	public List<String> selectAttach_v(int vNum) throws Exception;
	
	//게시글에 댓글을 삽입하는 메서드
	public void insertVillageReply_1(VillageReplyVO vrvo);
	
	//게시글 번호로 해당 게시글에 작성된 댓글을 검색 후 리스트를 리턴하는 메서드
	public List<VillageReplyVO> selectVillageReply_1(int vNum);
	
	//게시글 번호로 해당게시글에 작성된 댓글의 개수를 검색후 리턴하는 메서드
	public int selectReplyNum(int vNum);
	
	//게시글의 조회수를 1개씩 증가시키는 메서드
	public void updateVillageCnt(int vNum);
	
	//페이징 처리를 위해 전체 게시글의 개수를 검색후 리턴하는 메서드
	public int selectVillgeBoardCnt();
	
	//게시글 번호로 해당게시글을 삭제하는 메서드
	public void deleteVillageBoard(int vNum);
	
	//id값으로 게시글 테이블의 해당 id를 admin으로 바꾸는 메서드(탈퇴했을 시)
	public void updateVillageBoardMemberId(String id);
	
	//id값으로 댓글 테이블의 해당 id를 admin으로 바꾸는 메서드(탈퇴했을 시)
	public void updateVillageReply_1MemberId(String id);
	
	//게시글 번호와 파일이름으로 해당게시글의 특정파일을 삭제하는 메서드 : 객체(게시글 번호, 파일이름)
	public void deleteVillageAttach(VillageVO vvo);
	
	//게시글 번호와 파일이름으로 해당게시글의 특정파일을 삽입하는 메서드 : 객체(게시글 번호, 파일이름)
	public void updateVillageAttach(VillageVO vvo);
	
	//게시글 번호로 해당게시글의 내용을 수정하는 메서드
	public void updateVillageBoard(VillageVO vvo);
	
	//게시글 검색 메서드 (제목 검색, 제목+내용 검색 , 작성자 검색)
	public List<VillageVO> selectVillageSearch(VillagePageVO vpvo);
	
	//게시글 번호와 댓글 번호로 특정 댓글을 삭제하는 메서드
	public void deleteVillageReply(int vNum, int r1Num);
	
	//게시글 번호와 댓글 번호로 특정 댓글을 수정하는 메서드
	public void updateVillageReply(VillageReplyVO vrvo);
	
}
