package com.col.board.dao;

public class BoardcomVO {

    private String boardSeq;            // 게시글 번호
    private String comNum;              // 댓글 번호
    private String userID;              // 댓글 작성자
    private String comDate;             // 댓글 작성일
    private String comContent;          // 댓글 내용
    private String comDelFlag;          // 삭제 여부
    private String comParent;           // 부모 댓글
    private String comDepth;            // 깊이
    private Integer comOrder;           // 댓글 순서
    private String comLikeCnt;          // 추천수


    public String getBoardSeq() {
        return boardSeq;
    }

    public void setBoardSeq(String boardSeq) {
        this.boardSeq = boardSeq;
    }

    public String getComNum() {
        return comNum;
    }

    public void setComNum(String comNum) {
        this.comNum = comNum;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getComDate() {
        return comDate;
    }

    public void setComDate(String comDate) {
        this.comDate = comDate;
    }

    public String getComContent() {
        return comContent;
    }

    public void setComContent(String comContent) {
        this.comContent = comContent;
    }

    public String getComDelFalg() {
        return comDelFlag;
    }

    public void setComDelFalg(String comDelFlag) {
        this.comDelFlag = comDelFlag;
    }

    public String getComParent() {
        return comParent;
    }

    public void setComParent(String comParent) {
        this.comParent = comParent;
    }

    public String getComDepth() {
        return comDepth;
    }

    public void setComDepth(String comDepth) {
        this.comDepth = comDepth;
    }

    public Integer getComOrder() {
        return comOrder;
    }

    public void setComOrder(Integer comOrder) {
        this.comOrder = comOrder;
    }

    public String getComLikeCnt() {
        return comLikeCnt;
    }

    public void setComLikeCnt(String comLikeCnt) {
        this.comLikeCnt = comLikeCnt;
    }
}
