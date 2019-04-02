package com.col.board;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.col.board.dao.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.col.board.service.BoardService;

@Controller
@RequestMapping(value = "/board/*")
public class BoardController {

    @Autowired
    private BoardService brdService;

    HttpSession session = null;


    // 게시글 목록 + 페이징, 검색
    @RequestMapping(value = "list")
    public String boardList(SearchVO sVO, ModelMap modelMap) {

        if (sVO.getBoardCate() == null) {
            sVO.setBoardCate("1");
        }

        sVO.pageCal(brdService.selectBoardPage(sVO));

        List<BoardVO> listView = brdService.selectBoardList(sVO);

        modelMap.addAttribute("listView", listView);
        modelMap.addAttribute("sVO", sVO);

        return "board/boardList.tiles";
    }


    // 글 작성 페이지
    @RequestMapping(value = "writePage")
    public String writeForm(HttpServletRequest request, ModelMap modelMap) {

        String boardCate = request.getParameter("boardCate");
        String boardSeq = request.getParameter("boardSeq");

        System.out.println("*.###.* boardSeq : " + boardSeq);


        if (boardSeq != null) {
            BoardVO boardInfo = brdService.selectBoardOne(boardSeq);
            List<?> listView = brdService.selectBoardFileList(boardSeq);

            modelMap.addAttribute("boardInfo", boardInfo);
            modelMap.addAttribute("listView", listView);

            boardCate = boardInfo.getBoardCate();
        }

        modelMap.addAttribute("boardCate", boardCate);

        return "board/writePage.tiles";
    }


    // 글 저장 처리
    @RequestMapping(value = "boardSave")
    public String boardSave(HttpServletRequest request, BoardVO boardInfo) throws Exception {
        String[] fileNum= request.getParameterValues("fileNum");

        FileUpVO fs = new FileUpVO();
        List<FileVO> fileList = fs.saveAllFiles(boardInfo.getBoardFile());

        brdService.insertBoard(boardInfo, fileList, fileNum);

        return "redirect:list?boardCate=" + boardInfo.getBoardCate();
    }


    // 글 읽기
    @RequestMapping(value = "read")
    public String boardRead(HttpServletRequest request, ModelMap modelMap, String comNum) throws Exception {

        session = request.getSession(false);
        String boardSeq = request.getParameter("boardSeq");
        String likeCheck = request.getParameter("likeCheck");

        List<BoardcomVO> replyList = brdService.selectBoardReplyList(boardSeq);
        List<LikeVO> likeList = brdService.existLike(likeCheck);

        String check = "";
        if(likeCheck == null || "".equals(likeCheck)) {
            check = "fas fa-heart";
        }

        else {
            check = "far fa-heart";
        }

        brdService.updateBoardCnt(boardSeq);   // 조회수 증가
        BoardVO boardInfo = brdService.selectBoardOne(boardSeq);



        modelMap.addAttribute("boardInfo", boardInfo);
        modelMap.addAttribute("replyList", replyList);
        modelMap.addAttribute("check", check);

        return "board/boardRead.tiles";
    }


    // 글 삭제
    @RequestMapping(value = "delete")
    public String deleteBoard(HttpServletRequest request) {

        String boardCate = request.getParameter("boardCate");
        String boardSeq = request.getParameter("boardSeq");

        brdService.deleteBoardOne(boardSeq);

        return "redirect:list?boardCate="+boardCate;
    }


    // 댓글 저장
    @RequestMapping(value = "boardComSave")
    public String boardReplySave(HttpServletRequest request, BoardcomVO boardReplyInfo) {

        brdService.insertBoardReply(boardReplyInfo);

        return "redirect:read?boardSeq=" + boardReplyInfo.getBoardSeq();
    }


    // 댓글 삭제
    @RequestMapping(value = "boardComDelete")
    public String boardReplyDel(HttpServletRequest request, BoardcomVO boardReplyInfo) {

        brdService.deleteBoardReply(boardReplyInfo.getComNum());

        return "redirect:read?boardSeq=" + boardReplyInfo.getBoardSeq();
    }


    // 추천
    // 수정해야함
    @RequestMapping(value = "like")
    public String like(HttpServletRequest request, BoardcomVO boardReplyInfo) {
        String likeCheck = request.getParameter("likeCheck");
        List<LikeVO> likeList = brdService.existLike(likeCheck);

        String check = "";
        if(likeCheck == null || "".equals(likeCheck)) {
            check = "fas fa-heart";
        }

        else {
            check = "far fa-heart";
        }
        return "redirect:read?boardSeq=" + boardReplyInfo.getBoardSeq();
    }
}