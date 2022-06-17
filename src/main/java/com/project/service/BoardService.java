package com.project.service;

import com.project.vo.Board;
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

    void insertBoard(Board board, MultipartHttpServletRequest mpRequest) throws Exception;

    List<Board> viewBoard(Criteria cri);

    Board selectBoard(int bno);

    Board modifyBoard(int bno);

    void updateBoard(Board board, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws IOException;

    void deleteBoard(int bno);

    int countBoard(Criteria cri);

    List<Board> writerBoard(String bwriter);

    int searchBoard(String bwriter);

    Board heartBoard(int bno);

    void upBoard(int bno);

    void downBoard(int bno);

    List<Map<String, Object>> selectFile(int bno);

    Map<String, Object> downFile(Map<String, Object> map);


}
