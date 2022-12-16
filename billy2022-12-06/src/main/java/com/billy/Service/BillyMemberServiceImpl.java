package com.billy.Service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.billy.DAO.IF_billyDAO;
import com.billy.DAO.IF_billyMemberDAO;
import com.billy.VO.BillyGoodsAttachVO;
import com.billy.VO.BillyGoodsRentVO;
import com.billy.VO.BillyGoodsVO;
import com.billy.VO.BillyMemberVO;
import com.billy.mail.MailHandler;
import com.billy.mail.TempKey;

@Service
public class BillyMemberServiceImpl implements IF_billyMemberService {

	@Inject
	private IF_billyMemberDAO bmdao;

	@Inject
	private IF_billyDAO billyDao;
	
    @Autowired
    JavaMailSender mailSender;

	@Override
	public void insertMember(BillyMemberVO bmvo) throws Exception {
		System.out.println(bmvo.getEmail() + "--service단 회원가입 디버깅");
		//랜덤 문자열을 생성해서 mailKey 컬럼에 넣어주기
		String mailKey = new TempKey().getKey(10,false);//랜덤키 길이설정
		bmvo.setMailKey(mailKey);
		
		//회원가입
		bmdao.insertMember(bmvo);
		bmdao.updateMailKey(bmvo);
		
		//회원가입을 완료하면 인증을 위한 이메일 발송
		MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[billy 인증메일 입니다.]"); //메일제목
        sendMail.setText(
                "<h1>billy 메일인증</h1>" +
                "<br>billy에 오신것을 환영합니다!" +
                "<br>아래 [이메일 인증 확인]을 눌러주세요." +
                "<br><a href='http://localhost:8099/main/registerEmail?email="+ bmvo.getEmail() +
                "&mailKey=" + mailKey +
                "' target='_blank'>이메일 인증 확인</a>");
        sendMail.setFrom("billyhuman0727@gmail.com", "빌리");
        sendMail.setTo(bmvo.getEmail());
        sendMail.send();
	}

	@Override
	public int chkId(String id) throws Exception {
		System.out.println(id + "--service단 아이디 중복체크");
		return bmdao.chkId(id);
	}

	@Override
	public int chkName(String name) throws Exception {
		System.out.println(name + "--service단 별명 중복체크");
		return bmdao.chkName(name);
	}

	@Override
	public int memberLoginChk(BillyMemberVO bmvo) throws Exception {
		System.out.println(bmvo.getId() + "--service단 로그인 디버깅");
		return bmdao.memberLoginChk(bmvo);
	}

	@Override
	public BillyMemberVO myPageInfo(String id) throws Exception {
		System.out.println(id + "--service단 내정보보기 디버깅");
		return bmdao.myPageInfo(id);
	}

	@Override
	public void memberInfoUpdate(BillyMemberVO bmvo) throws Exception {
		System.out.println(bmvo.getId()+"--서비스단 정보수정 디버깅");
		System.out.println(bmvo.getPhotoName()+"--서비스단 사진 안넘기면 값");
		if(bmvo.getPhotoName()==null) {
			bmvo.setPhotoName("N");
		}		
		bmdao.memberInfoUpdate(bmvo);
		
	}

	@Override
	public void deleteMember(String id) throws Exception {
		System.out.println(id+"--서비스단 탈퇴 디버깅");
		bmdao.deleteMember(id);
		
	}

	@Override
	public int updateMailKey(BillyMemberVO bmvo) throws Exception {
		System.out.println(bmvo.getId()+"--서비스단 이메일 인증키 디버깅");
		return bmdao.updateMailKey(bmvo);
	}

	@Override
	public int updateMailAuth(BillyMemberVO bmvo) throws Exception {
		System.out.println(bmvo.getId()+"--서비스단 이메일 인증받았으면 0>1로 바뀌는기능 디버깅");
		return bmdao.updateMailAuth(bmvo);
	}

	@Override
	public int emailAuthFail(String id) throws Exception {
		System.out.println(id+"--서비스단 회원가입시 이메일 인증여부 체크 디버깅");
		return bmdao.emailAuthFail(id);

	}

	@Override
	public void pwdSearchEmailSend(BillyMemberVO bmvo) throws Exception {
		String mailKey = new TempKey().getKey(10,false);//랜덤키 길이설정
		bmvo.setMailKey(mailKey);
		updateMailKey(bmvo);		
		System.out.println("보낸 인증키 : " + mailKey);
		
		MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("[billy 비밀번호 찾기 인증키 입니다.]"); //메일제목
        sendMail.setText(
                "<h1>billy 비밀번호 찾기</h1>" +
                "<br>아래 [인증키]를 비밀번호찾기 인증입력창에 적어주세요." +
                "<br><p>" + mailKey + "</p>");
        sendMail.setFrom("billyhuman0727@gmail.com", "빌리");
        sendMail.setTo(bmvo.getEmail());
        sendMail.send();
		
	}

	@Override
	public void pwdModAction(BillyMemberVO bmvo) throws Exception {
		System.out.println(bmvo.getPwd()+"--서비스단 비번변경 비밀번호 디버깅");
		bmdao.pwdModAction(bmvo);
	}

	@Override
	public List<BillyGoodsVO> myBookmarkList(String id) throws Exception {
		System.out.println(id+"--서비스단 찜목록 불러오기 디버깅");
		List<BillyGoodsVO> bList = bmdao.myBookmarkList(id);	
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
	public List<BillyGoodsVO> selectMyBillyGoods(String id) throws Exception {
		System.out.println(id+"--서비스단 내가 등록한 빌리 디버깅");
		List<BillyGoodsVO> bList = bmdao.selectMyBillyGoods(id);
		System.out.println(bList.get(0).getgNum() + "-----service단 찜목록보기 번호 디버깅");
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
	public List<BillyGoodsRentVO> selectMyBillyTransactionList(String id) throws Exception {
		System.out.println(id+"--서비스단 내가 빌린 빌리 디버깅");
		
		return bmdao.selectMyBillyTransactionList(id);
	}
	
	
}