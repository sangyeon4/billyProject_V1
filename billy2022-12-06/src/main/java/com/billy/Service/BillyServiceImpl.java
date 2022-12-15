package com.billy.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.billy.DAO.IF_billyDAO;
import com.billy.VO.BillyGoodsAttachVO;
import com.billy.VO.BillyGoodsLikeVO;
import com.billy.VO.BillyGoodsRentVO;
import com.billy.VO.BillyGoodsVO;

@Service
public class BillyServiceImpl implements IF_billyService {

	@Inject
	private IF_billyDAO billyDao;
	

	@Override
	public void insertBilly(BillyGoodsVO bvo) throws Exception {
		billyDao.insertBilly(bvo);
		System.out.println(bvo.getId() + "-------service단 빌리등록 디버깅");
		String[] fname = bvo.getFiles(); //파일이름 받아오기
		if (fname != null) {
			for (int i = 0; i < fname.length; i++) {
				if (fname[i] != null) {
					billyDao.insertAttach(fname[i]); //파일이름을 DB에 저장
				}
			}
		}
	}
	@Override
	public int selectMaxCnt() throws Exception {
		System.out.println(billyDao.selectMaxCnt() + "---service 빌리 글번호 디버깅");
		return billyDao.selectMaxCnt() + 1; // DB에서 가져온 값에서 +1
	}

	@Override
	public List<BillyGoodsVO> selectBillyAll() throws Exception { 
		List<BillyGoodsVO> bList = billyDao.selectBillyAll();
		System.out.println(bList.get(0).getgNum() + "-----service단 전체보기시 번호 디버깅");
		List<BillyGoodsAttachVO> baList = billyDao.selectBillyAttach();
		for (int i = 0; i < bList.size(); i++) {
			String[] temp = new String[1];
			for (int j = 0; j < baList.size(); j++) {
				if (bList.get(i).getgNum() == baList.get(j).getgNum()) {
					temp[0] = baList.get(j).getfName(); // 사진하나받아오기
					bList.get(i).setFiles(temp);
					System.out.println(temp[0] + "----service단 빌리 전체보기 디버깅");
					System.out.println(bList.get(i).getFiles()[0] + "----service단 빌리 전체보기 디버깅");
				}
			}
		}
		return bList;

	}
	@Override
	public BillyGoodsVO selectBillyOne(String vno) throws Exception {
		System.out.println(billyDao.selectBillyOne(vno).getgNum()+"service단 빌리자세히보기 디버깅");		
		BillyGoodsVO bvo=billyDao.selectBillyOne(vno);
		bvo.setName(billyDao.selectOnebillyName(vno));
		List<BillyGoodsAttachVO>baList=billyDao.selectOneBillyAttach(vno);
		System.out.println(baList.size()+"----service단 빌리 자세히보기(파일)사이즈 디버깅");
		if(baList.size()!=0) { //해당글에 저장되어있는 사진 개수
			String[] temp= new String[baList.size()]; //리스트 자료형에 담겨있는 사진들을 배열 자료형으로 바꿔주기 위함
			for(int i=0; i<baList.size();i++) {
				temp[i]=baList.get(i).getfName();				 
			}
			bvo.setFiles(temp);
		}
		return bvo;
	}
	@Override
	public void updateBilly(BillyGoodsVO bvo) throws Exception {
		System.out.println(bvo.getgNum()+"---service단 빌리 수정하기 디버깅");		
		billyDao.updateBilly(bvo);
		
	}
	@Override
	public void updateBillyMemberId(String id) throws Exception {
		System.out.println(id+"---service단 회원탈퇴시 빌리처리 id 디버깅 ");
		billyDao.updateBillyMemberId(id);
		
		
	}
	@Override
	public int selectCntBillyLike(BillyGoodsLikeVO blvo) throws Exception {
		System.out.println(blvo.getgNum()+"----service단 빌리자세히보기(좋아요클릭유무) gNum디버깅");
		return billyDao.selectCntBillyLike(blvo);
	}
	@Override
	public void billyLikeUp(BillyGoodsLikeVO blvo) throws Exception {
		billyDao.billyLikeUp(blvo);
		System.out.println(blvo.getgNum()+"---service단 likeUp디버깅");		
	}
	@Override
	public void billyLikeDown(BillyGoodsLikeVO blvo) throws Exception {
		billyDao.billyLikeDown(blvo);
		System.out.println(blvo.getgNum()+"---service단 likeDown디버깅");
	}
	@Override
	public void insertBilleyTransaction(BillyGoodsRentVO brvo) throws Exception {
		billyDao.insertBilleyTransaction(brvo);
		System.out.println(brvo.getId()+"----service단 insertBilleyTransaction 디버깅");		
	}
	@Override
	public String selectBillyRentdate(String gNum) throws Exception {
		List<String>temp=billyDao.selectBillyRentdate(gNum);
		String rDate=null; //여러날짜를 하나의 날짜로 보내기위해 만들어주는 작업
		for(int i=0; i<temp.size();i++) {
			rDate+=temp.get(i)+","; //JS에서 마지막배열에 있는 ,는 제거해줄것*
		}
		return rDate;
	}
	@Override
	public List<BillyGoodsAttachVO> selectOneBillyAttach(String vno) throws Exception {
		System.out.println("---service단 selectAttachOne디버깅");	
		return billyDao.selectOneBillyAttach(vno);
	}
	@Override
	public void deleteBillyAttach(BillyGoodsVO bvo) throws Exception {
		System.out.println("---service단 deleteBillyAttach디버깅");	
		billyDao.deleteBillyAttach(bvo);
	}
	@Override
	public void updateBillyAttach(BillyGoodsVO bvo) throws Exception {
		Map<String, String> map = new HashMap<>();
		for (int i = 0; i < bvo.getFiles().length; i++) {
			String file = bvo.getFiles()[i];
			System.out.println(file);
			String num = Integer.toString(bvo.getgNum());
			System.out.println(num);
			map.put("vNum" + i, num);
			map.put("file" + i, file);
		}
		System.out.println("---service단updateBillyAttach디버깅");	
		billyDao.updateBillyAttach(map);
	}
	@Override
	public void deleteBillyOne(String vno) throws Exception { //빌리삭제
		System.out.println(vno+"---service단 deleteBillyOne 디버깅");
		billyDao.deleteBillyAttachGnun(vno); //1. 파일삭제
		billyDao.updateBillyTransactionNo_1(vno);//2.트랜잭션에 있는 글번호를 0번으로 수정
		billyDao.deleteBillyGoods(vno);//3.빌리삭제		
	}
}
