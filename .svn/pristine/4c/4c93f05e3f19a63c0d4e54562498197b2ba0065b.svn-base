package com.col.board.service;


import com.col.board.dao.*;
import org.apache.ibatis.session.ResultHandler;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import java.util.HashMap;
import java.util.List;

@Service
public class BoardService {

    @Autowired
    private SqlSessionTemplate sqlSession;

    @Autowired
    private DataSourceTransactionManager txManager;


    // 글 목록
    public List<BoardVO> selectBoardList(SearchVO param) {
        return sqlSession.selectList("selectBoardList", param);
    }


    // 페이지 번호, 검색
    public Integer selectBoardPage(SearchVO param) {
        return sqlSession.selectOne("selectBoardPage", param);
    }


    // 글 저장
    public void insertBoard(BoardVO param, List<FileVO> fileList, String[] fileNum) {
        DefaultTransactionDefinition def = new DefaultTransactionDefinition();
        def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
        TransactionStatus status = txManager.getTransaction(def);

        try {
            if (param.getBoardSeq()==null || "".equals(param.getBoardSeq())) {
                sqlSession.insert("insertBoard", param);
            }

            else {
                sqlSession.update("updateBoard", param);
            }

            if (fileNum != null) {
                HashMap<String, String[]> fparam = new HashMap<String, String[]>();
                fparam.put("fileNum", fileNum);
                sqlSession.insert("delteBoardFile", fparam);
            }

            for (FileVO f : fileList) {
                f.setBoardSeq(param.getBoardSeq());
                sqlSession.insert("insertBoardFile", f);
            }
            txManager.commit(status);
        }

        catch (Exception e) {
            txManager.rollback(status);
            throw e;
        }
//        sqlSession.insert("insertBoard", param);
    }


    // 첨부 파일
    public List<FileVO> selectBoardFileList(String param) {
        return sqlSession.selectList("selectBoardFileList", param);
    }


    // 글 읽기
    public BoardVO selectBoardOne(String param) {
        return sqlSession.selectOne("selectBoardOne", param);
    }

    // 글 수정
    public void updateBoard(BoardVO param) {
        sqlSession.insert("updateBoard", param);
    }


    // 글 삭제
    public void deleteBoardOne(String param) {
        sqlSession.delete("deleteBoard", param);
    }


    // 조회수 증가
    public void updateBoardCnt(String param) {
        sqlSession.update("updateBoardCnt", param);
    }

    // 추천수 증가
    public void updateLikeCnt(String param) {
        sqlSession.update("updateLikeCnt", param);
    }

    // 추천 insert
    public void insertLike(HashMap<String,String> map) {
        sqlSession.insert("insertLike", map);
    }

    // 추천수 감소
    public void deleteLike(String param) {
        sqlSession.delete("deleteLike", param);
    }

    public void likeCntDown(String param) {
        sqlSession.update("likeCntDown", param);
    }

    public List<LikeVO> existLike(String param){
         return sqlSession.selectList("existLike", param);
    }

    //댓글
    public List<BoardcomVO> selectBoardReplyList(String param) {
        return sqlSession.selectList("selectBoardReplyList", param);
    }


    // 댓글 작성
    public void insertBoardReply(BoardcomVO param) {
        if (param.getComNum() == null || "".equals(param.getComNum())) {
            // 부모댓글 유무 확인
            if (param.getComParent() != null) {
                BoardcomVO replyInfo = sqlSession.selectOne("selectBoardReplyParent", param.getComParent());
                param.setComDepth(replyInfo.getComDepth());
                param.setComOrder(replyInfo.getComOrder()+1);
                sqlSession.selectOne("updateBoardReplyOrder", replyInfo);
            }

            else {
                Integer comOrder = sqlSession.selectOne("selectBoardReplyMaxOrder", param.getBoardSeq());
                param.setComOrder(comOrder);
            }

            sqlSession.insert("insertBoardReply", param);
        }

        else {
            sqlSession.insert("updateBoardReply", param);
        }
    }

    // 댓글 삭제 자식 댓글 있으면 삭제 불가.
    public boolean deleteBoardReply(String param) {
        Integer cnt = sqlSession.selectOne("selectBoardReplyChild", param);

        if ( cnt > 0) {
            return false;
        }

        sqlSession.update("updateBoardReplyOrderDelete", param);

        sqlSession.delete("deleteBoardReply", param);

        return true;
    }
}
