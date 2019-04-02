package com.col.board.dao;



public class PageVO {
    private Integer displayRowCount=10;         // 출력할 데이터 개수
    private Integer rowStart;               // 시작 행 번호
    private Integer rowEnd;                 // 종료 행 번호
    private Integer totalPage;              // 전체 페이지 수
    private Integer totalRow;               // 전체 데이터 수
    private Integer page;                   // 현재 페이지
    private Integer pageStart;              // 시작 페이지
    private Integer pageEnd;                // 종료 페이지


    /*
     * 전체 데이터 수를 이용하여 페이지 수 계산
     */
    public void pageCal(Integer total) {
        getPage();
        totalRow = total;   // 전체 데이터 갯수를 totalRow에 저장
        totalPage = (total / displayRowCount);


        if(total % displayRowCount > 0) {
            totalPage++;
        }


        pageStart = (page - (page - 1) % 10);
        pageEnd = pageStart + 9;


        if(pageEnd > totalPage) {
            pageEnd = totalPage;
        }


        rowStart = ((page - 1) * displayRowCount) + 1;
        rowEnd = rowStart + displayRowCount -1;
    }


    public Integer getDisplayRowCount() {
        return displayRowCount;
    }

    public void setDisplayRowCount(Integer displayRowCount) {
        this.displayRowCount = displayRowCount;
    }

    public Integer getRowStart() {
        return rowStart;
    }

    public void setRowStart(Integer rowStart) {
        this.rowStart = rowStart;
    }

    public Integer getRowEnd() {
        return rowEnd;
    }

    public void setRowEnd(Integer rowEnd) {
        this.rowEnd = rowEnd;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Integer getTotalRow() {
        return totalRow;
    }

    public void setTotalRow(Integer totalRow) {
        this.totalRow = totalRow;
    }

    // 현재 페이지 번호
    public Integer getPage() {

        // page가 0이거나 null이면 1로 리턴
        if (page == null || page == 0) {
            page = 1;
        }

        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageStart() {
        return pageStart;
    }

    public void setPageStart(Integer pageStart) {
        this.pageStart = pageStart;
    }

    public Integer getPageEnd() {
        return pageEnd;
    }

    public void setPageEnd(Integer pageEnd) {
        this.pageEnd = pageEnd;
    }
}
