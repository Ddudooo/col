package com.col.board.dao;

public class FileVO {

    private Integer fileNum;            // 파일 번호
    private String boardSeq;            // 게시글 번호
    private String fileName;            // 파일 명
    private String fileRealName;        // 실제 파일 명
    private long fileSize;              // 파일크기


    public String size2String() {
        Integer unit = 1024;
        if (fileSize < unit){
            return String.format("(%d B)", fileSize);
        }
        int exp = (int) (Math.log(fileSize) / Math.log(unit));

        return String.format("(%.0f %s)", fileSize / Math.pow(unit, exp), "KMGTPE".charAt(exp-1));
    }



    public Integer getFileNum() {
        return fileNum;
    }

    public void setFileNum(Integer fileNum) {
        this.fileNum = fileNum;
    }

    public String getBoardSeq() {
        return boardSeq;
    }

    public void setBoardSeq(String boardSeq) {
        this.boardSeq = boardSeq;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFileRealName() {
        return fileRealName;
    }

    public void setFileRealName(String fileRealName) {
        this.fileRealName = fileRealName;
    }

    public long getFileSize() {
        return fileSize;
    }

    public void setFileSize(long fileSize) {
        this.fileSize = fileSize;
    }
}
