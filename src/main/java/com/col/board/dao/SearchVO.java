package com.col.board.dao;



public class SearchVO extends PageVO {

    private String searchKeyword = "";           // 검색 키워드

    private String searchType = "";                // 검색 필드: 제목, 내용

    private String[] searchTypeArr;                // 검색 필드를 배열로 변환

    private String boardCate;                   // 게시판 종류



    public String getSearchKeyword() {

        return searchKeyword;

    }

    public void setSearchKeyword(String searchKeyword) {

        this.searchKeyword = searchKeyword;

    }

    public String getSearchType() {

        return searchType;

    }

    public void setSearchType(String searchType) {

        this.searchType = searchType;

    }

    public String[] getSearchTypeArr() {

        return searchType.split(",");

    }

    public String getBoardCate() {

        return boardCate;
    }

    public void setBoardCate(String boardCate) {

        this.boardCate = boardCate;
    }
}