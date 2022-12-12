package com.billy.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.billy.DAO.IF_billyDAO;
import com.billy.VO.BillyGoodsVO;
import com.billy.VO.BillyGoods_attachVO;
import com.billy.VO.BillyGoods_likeVO;

@Service
public class BillyServiceImpl implements IF_billyService {

	@Inject
	private IF_billyDAO billyDao;
	

	@Override
	public void insertBilly(BillyGoodsVO bvo) throws Exception {
		billyDao.insertBilly(bvo);
		System.out.println(bvo.getId() + "-------service단 빌리등록 디버깅");
		String[] fname = bvo.getFiles();
		if (fname != null) {
			for (int i = 0; i < fname.length; i++) {
				if (fname[i] != null) {
					billyDao.insertAttach(fname[i]);
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
	public List<BillyGoodsVO> selectBillyAll() throws Exception{  //모든 빌리+사진하나
		List<BillyGoodsVO>bList=billyDao.selectBillyAll();
		System.out.println(bList.get(0).getgNum()+"-----service단 전체보기시 번호 디버깅");
		List<BillyGoods_attachVO>baList=billyDao.selectBilly_attach();
		if(baList.size()!=0) {
			for(int i=0; i<bList.size();i++){
				String[] temp= new String[1];
				for(int j=0;j<baList.size();j++) {
					if(bList.get(i).getgNum()==baList.get(j).getgNum()) {
						temp[0]=baList.get(j).getfName(); //사진하나받아오기
						bList.get(i).setFiles(temp);
						System.out.println(temp[0]+"----service단 빌리 전체보기 디버깅");
						System.out.println(bList.get(i).getFiles()[0]+"----service단 빌리 전체보기 디버깅");
						return bList;
					}
				}
			}			
		}
		return null;
	}
	@Override
	public BillyGoodsVO selectBillyOne(String vno) throws Exception {
		System.out.println(billyDao.selectBillyOne(vno).getgNum()+"service단 빌리자세히보기 디버깅");		
		BillyGoodsVO bvo=billyDao.selectBillyOne(vno);
		bvo.setName(billyDao.selectOnebilly_name(vno));
		List<BillyGoods_attachVO>baList=billyDao.selectOneBilly_attach(vno);
		System.out.println(baList.size()+"----service단 빌리 자세히보기(파일)사이즈 디버깅");
		if(baList.size()!=0) {
			String[] temp= new String[2];
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
	public int selectCntBilly_like(BillyGoods_likeVO blvo) throws Exception {
		System.out.println(blvo.getgNum()+"----service단 빌리자세히보기(좋아요클릭유무) gNum디버깅");
		return billyDao.selectCntBilly_like(blvo);
	}
	@Override
	public void billyLikeUp(BillyGoods_likeVO blvo) throws Exception {
		billyDao.billyLikeUp(blvo);
		System.out.println(blvo.getgNum()+"---service단 likeUp디버깅");		
	}
	@Override
	public void billyLikeDown(BillyGoods_likeVO blvo) throws Exception {
		billyDao.billyLikeDown(blvo);
		System.out.println(blvo.getgNum()+"---service단 likeDown디버깅");
	}

	

}
