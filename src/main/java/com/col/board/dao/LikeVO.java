package com.col.board.dao;

public class LikeVO {

    private String likeNum;         // 좋아요 번호
    private String comNum;          // 댓글 번호
    private String likeCheck;       // 0은 안누름, 1은 누름 중복 방지용
    private String userID;          // 누른 사람 ID


    public String getLikeNum() {
        return likeNum;
    }

    public void setLikeNum(String likeNum) {
        this.likeNum = likeNum;
    }

    public String getComNum() {
        return comNum;
    }

    public void setComNum(String comNum) {
        this.comNum = comNum;
    }

    public String getLikeCheck() {
        return likeCheck;
    }

    public void setLikeCheck(String likeCheck) {
        this.likeCheck = likeCheck;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }
}
