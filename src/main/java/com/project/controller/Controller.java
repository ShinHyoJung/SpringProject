package com.project.controller;

import com.project.dto.BoardDTO;
import com.project.dto.MemberDTO;
import com.project.service.BoardService;
import com.project.service.MemberService;
import org.mariadb.jdbc.internal.logging.Logger;
import org.mariadb.jdbc.internal.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * Created with IntellliJ IDEA.
 * MemberDTO: nandsoft
 * Date: 2022-02-14
 * Time: 오전 11:01
 * Comments:
 */
@org.springframework.stereotype.Controller
public class Controller
{
    private Logger logger = LoggerFactory.getLogger(Controller.class);
    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Autowired // 의존성주입방법
    private MemberService memberService;
    @Autowired
    private BoardService boardService;

    @RequestMapping("/") // 홈
    public String home(Model model) {

        return "home";
    }

    @RequestMapping("/login") // 로그인 창
    public String login() {

        logger.info("Login Page");
        return "member/login";
    }

    @RequestMapping(value="/logindo", method= RequestMethod.POST) //로그인 처리
    public String logindo(MemberDTO member, HttpSession session) throws Exception {
        logger.info("Login");

        //웹에 접근한 사용자 식별하는 방법
        MemberDTO login = memberService.loginMember(member);

        // 로그인정보에서 id값 추출
        boolean passMatch = bCryptPasswordEncoder.matches(member.getPassword(), login.getPassword());

        if(login!=null && passMatch) {
            session.setAttribute("login", login);
            String id = login.getId();
            session.setAttribute("id", id);
            //세션에 로그인정보 애트리뷰트와 아이디 애트리뷰트 저장
            return "redirect:/list";
        } else { // 비밀번호가 틀렸습니다 알림창 구현
            return "redirect:/login";
        }// 아이디가 틀린경우 구현
    }

    @RequestMapping("/logout") // 로그아웃
    public String logout(HttpSession session) {

        session.invalidate();
        logger.info("Logout");
        return "home";
    }

    @RequestMapping("/beforesignup") // 회원가입 창
    public String beforesignup()
    {
        return "member/signup";
    }

    @RequestMapping("/signup") // 회원가입 처리
    public String signup(@ModelAttribute MemberDTO member) throws Exception {

        String pwdbCrypt = bCryptPasswordEncoder.encode(member.getPassword()); //비밀번호 암호화
        member.setPassword(pwdbCrypt);
        memberService.insertMember(member);
        return "home";
    }


    @RequestMapping("/info") // 회원정보 조회
    public String selectInfo(MemberDTO member, HttpSession session, Model model) throws Exception {

        String id = (String)session.getAttribute("id");
        // 세션 아이디 애트리뷰트에서 아이디값을 가져옴
        MemberDTO user = memberService.selectMember(id);
        model.addAttribute("user", user);

        return "member/info";
    }

    @RequestMapping("/update") // 회원정보 수정
    public String updateInfo(MemberDTO member) throws Exception {

        String pwdbCrypt = bCryptPasswordEncoder.encode(member.getPassword()); // 수정된 비밀번호 암호화
        member.setPassword(pwdbCrypt);
        memberService.updateMember(member);
        return "redirect:/info";
    }

    @RequestMapping("/quit") // 회원탈퇴
    public String quit(MemberDTO member, HttpSession session) throws Exception {

        String id = (String)session.getAttribute("id");

        memberService.deleteMember(id);
        return "home";
    }

    @RequestMapping(value="/list", method=RequestMethod.GET) // 게시판 리스트
    public String list(Model model) throws Exception {

        List<BoardDTO> list= boardService.viewBoard();
        model.addAttribute("list", list);
        return "board/list";
    }

    @RequestMapping("/write") // 게시글 쓰기
    public String write(MemberDTO member, Model model, HttpSession session) throws Exception {

        String id = (String)session.getAttribute("id");
        MemberDTO user = memberService.selectMember(id);
        model.addAttribute("user", user);
        return "board/write";
    }

    @RequestMapping("/enroll") // 게시글 등록
    public String enroll(BoardDTO board) throws Exception {

        boardService.writeBoard(board);
        return "redirect:/list";
    }

    @RequestMapping(value="/read/{bno}", method = RequestMethod.GET) // 게시글 읽기
    public String read(@PathVariable("bno")int bno, Model model) throws Exception {
    // 게시글 번호를 받아서 경로설정
        BoardDTO board = boardService.readBoard(bno);

        model.addAttribute("board", board);
        return "board/read";
    }

    @RequestMapping(value="/modify/{bno}", method = RequestMethod.GET) // 게시글 수정 페이지
    public String modify(@PathVariable("bno")int bno, Model model) throws Exception {

        BoardDTO board = boardService.modifyBoard(bno);
        model.addAttribute("board", board);
        return "board/modify";
    }


    @RequestMapping(value = "/update", method = RequestMethod.POST) // 게시글 수정
    public String update(BoardDTO board) throws Exception {

        boardService.updateBoard(board);
        return "redirect:list";
    }

    @RequestMapping("/delete") // 게시글 삭제
    public String delete(int bno) throws Exception {

        boardService.deleteBoard(bno);
        return "redirect:list";
    }

}
