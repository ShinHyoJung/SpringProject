package com.project.controller;

import com.project.dto.*;
import com.project.service.BoardService;
import com.project.service.CommentService;
import com.project.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-24
 * Time: 오후 4:12
 * Comments:
 */

@Controller
public class BoardController {


    @Autowired // 의존성주입방법
    private MemberService memberService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private CommentService commentService;


    @RequestMapping(value="/list", method= RequestMethod.GET) // 게시판 목록
    public String List(Criteria cri, Model model) throws Exception {

        List<BoardDTO> list= boardService.viewBoard(cri);
        model.addAttribute("list", list);

        int total = boardService.countBoard(cri);
        PagingDTO page = new PagingDTO(cri, total);
        model.addAttribute("page", page);
        return "board/list";
    }

    @RequestMapping("/write") // 게시글 쓰기
    public String writeBoard(MemberDTO member, Model model, HttpSession session) throws Exception {

        String id = (String)session.getAttribute("id");
        MemberDTO user = memberService.selectMember(id);
        model.addAttribute("user", user);
        return "board/write";
    }

    @RequestMapping("/enroll") // 게시글 등록
    public String enrollBoard(BoardDTO board) throws Exception {

        boardService.insertBoard(board);
        return "redirect:/list";
    }

    @RequestMapping(value="/read/{bno}", method = RequestMethod.GET) // 게시글 읽기
    public String readBoard(@PathVariable("bno")int bno, MemberDTO member, Model model, HttpSession session) throws Exception {
        // 게시글 번호를 받아서 경로설정
        BoardDTO board = boardService.selectBoard(bno);
        String id = (String)session.getAttribute("id");
        MemberDTO user = memberService.selectMember(id);
        CommentDTO comment = new CommentDTO();
        comment.setBno(bno);
        List<CommentDTO> comments = commentService.selectComment(comment);
        model.addAttribute("board", board);
        model.addAttribute("user", user);
        model.addAttribute("comments", comments);
        return "board/read";
    }

    @RequestMapping(value="/modify/{bno}", method = RequestMethod.GET) // 게시글 수정 페이지
    public String modifyBoard(@PathVariable("bno")int bno, Model model) throws Exception {

        BoardDTO board = boardService.modifyBoard(bno);
        model.addAttribute("board", board);
        return "board/modify";
    }


    @RequestMapping(value = "/update", method = RequestMethod.POST) // 게시글 수정
    public String updateBoard(BoardDTO board) throws Exception {

        boardService.updateBoard(board);
        return "redirect:list";
    }

    @RequestMapping("/delete") // 게시글 삭제
    public String deleteBoard(int bno) throws Exception {

        boardService.deleteBoard(bno);
        return "redirect:list";
    }

    @RequestMapping(value="/search/{bwriter}", method=RequestMethod.GET) // 게시글 작성자 검색
    public String searchBoard(@PathVariable("bwriter")String bwriter, Model model) throws Exception {

        List<BoardDTO> result = boardService.searchBoard(bwriter);
        String writer = bwriter;
        model.addAttribute("result",result);
        model.addAttribute("writer", writer);
        return "board/search";
    }

    @RequestMapping("/upBoard")
    @ResponseBody
    public String upBoard(int bno) throws Exception {

        boardService.upBoard(bno);
        return "success";
    }
}
