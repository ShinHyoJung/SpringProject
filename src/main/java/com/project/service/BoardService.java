package com.project.service;

import com.project.dto.BoardDTO;
import com.project.dto.Criteria;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-21
 * Time: 오전 8:36
 * Comments:
 */
public interface BoardService {

    void insertBoard(BoardDTO board, MultipartHttpServletRequest mpRequest) throws Exception;

    List<BoardDTO> viewBoard(Criteria cri);

    BoardDTO selectBoard(int bno);

    BoardDTO modifyBoard(int bno);

    void updateBoard(BoardDTO board, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws IOException;

    void deleteBoard(int bno);

    int countBoard(Criteria cri);

    List<BoardDTO> searchBoard(String bwriter);

    BoardDTO heartBoard(int bno);

    void upBoard(int bno);

    void downBoard(int bno);

    List<Map<String, Object>> selectFile(int bno);

    Map<String, Object> downFile(Map<String, Object> map);


}
