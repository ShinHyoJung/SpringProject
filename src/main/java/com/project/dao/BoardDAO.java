package com.project.dao;

import com.project.vo.Board;
import com.project.dto.Criteria;

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

    void insertBoard(Board board);

    List<Board> viewBoard(Criteria cri); // 페이징을 적용해서 목록을 띄우기 위함

    Board selectBoard(int bno);

    Board modifyBoard(int bno);

    void updateBoard(Board board);

    void deleteBoard(int bno);

    int hitBoard(int bno);

    int countBoard(Criteria cri);

    List<Board> writerBoard(String bwriter);

    int searchBoard(String bwriter);

    Board heartBoard(int bno);

    void upBoard(int bno);

    void downBoard(int bno);

    void insertFile(Map<String, Object> map);

    List<Map<String, Object>> selectFile(int bno);

    Map<String, Object> downFile(Map<String, Object> map);

    void updateFile(Map<String, Object> map);

}