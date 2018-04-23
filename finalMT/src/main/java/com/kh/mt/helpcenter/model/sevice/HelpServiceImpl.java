package com.kh.mt.helpcenter.model.sevice;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;

import com.kh.mt.board.model.vo.BoardFile;
import com.kh.mt.common.PageInfo;
import com.kh.mt.helpcenter.model.dao.HelpDao;
import com.kh.mt.helpcenter.model.vo.HelpMainVo;

@Service
public class HelpServiceImpl implements HelpService{
	
	@Autowired
	private HelpDao hd;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 고객센터 메인화면(=자주묻는 질문)
	@Override
    public ArrayList<HelpMainVo> listAll(String b_type) throws Exception {
        
    	ArrayList<HelpMainVo> list = null;
    	
    	list = hd.listAll(b_type);
    	
    	return list;
    }

    // 자주묻는 질문 검색
	@Override
	public ArrayList<HelpMainVo> sList(String word) {

		ArrayList<HelpMainVo> sList = null;
		
		sList = hd.sList(word);
		
		return sList;
	}

	// 1:1 문의글
	@Override
	public void personal(HelpMainVo hm) {

		int result = hd.personal(sqlSession, hm);
		
	}

	// 신고대상 아이디 체크
	@Override
	public String bullyIdCheck(String bullyId) {

		String userId = hd.bullyIdCheck(bullyId);
		
		return userId;
	} 

	// 신고하기(신고대상 아이디/내용)
	@Override
	public void report(HelpMainVo hm) {

		int result = hd.report(sqlSession, hm);
	}

	// 신고하기(파일)
	@Override
	public void reportFile(BoardFile bf) {

		int result = hd.reportFile(sqlSession, bf);
	}

	// 공지글 목록
	@Override
	public ArrayList<HelpMainVo> nList(PageInfo pi) {
		
		ArrayList<HelpMainVo> nList = null;
    	
		nList = hd.nList(pi);
    	
    	return nList;
	}

	// 공지글 상세보기
	@Override
	public ArrayList<HelpMainVo> nListDetail(String b_code) {

		ArrayList<HelpMainVo> nListDetail = null;
		
		int result = hd.updateCount(b_code);
    	
		nListDetail = hd.nListDetail(b_code);
    	
    	return nListDetail;
	}

	// 총 공지글 수
	@Override
	public int nListTotal() {

		int nListTotal = hd.nListTotal();
		
		return nListTotal;
	}

	
}
