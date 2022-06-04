package com.project.dao;

import com.project.dto.BoardDTO;
import com.project.dto.Criteria;
import com.project.dto.PagingDTO;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-21
 * Time: 오전 8:36
 * Comments:
 */
public interface BoardDAO {

    void insertBoard(BoardDTO board);

    List<BoardDTO> viewBoard(Criteria cri); // 페이징을 적용해서 목록을 띄우기 위함

    BoardDTO selectBoard(int bno);

    BoardDTO modifyBoard(int bno);

    void updateBoard(BoardDTO board);

    void deleteBoard(int bno);

    int hitBoard(int bno);

    int countBoard(Criteria cri);

    List<BoardDTO> writerBoard(String bwriter);

    int searchBoard(String bwriter);

    BoardDTO heartBoard(int bno);

    void upBoard(int bno);

    void downBoard(int bno);

    void insertFile(Map<String, Object> map);

    List<Map<String, Object>> selectFile(int bno);

    Map<String, Object> downFile(Map<String, Object> map);

    void updateFile(Map<String, Object> map);

}