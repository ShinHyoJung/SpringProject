package com.project.service;

import com.project.util.FileUtils;
import com.project.dao.BoardDAO;
import com.project.dto.BoardDTO;
import com.project.dto.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-02-21
 * Time: 오전 8:37
 * Comments:
 */

@Service
public class BoardServiceImpl implements BoardService {

    @Resource(name="fileUtils")
    private FileUtils fileUtils;
    @Autowired
    BoardDAO boardDAO;

    @Override
    public void insertBoard(BoardDTO board, MultipartHttpServletRequest mpRequest) throws  Exception {
        boardDAO.insertBoard(board);

        List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(board, mpRequest);
        int size = list.size();
        for(int i=0; i<size; i++) {
            boardDAO.insertFile(list.get(i));
        }
    }

    @Override
    public List<BoardDTO> viewBoard(Criteria cri) throws Exception {
        return boardDAO.viewBoard(cri);
    }

    @Override
    public BoardDTO selectBoard(int bno) throws Exception {

        boardDAO.hitBoard(bno);
        return boardDAO.selectBoard(bno);
    }

    @Override
    public BoardDTO modifyBoard(int bno) throws Exception {
        return boardDAO.modifyBoard(bno);
    }

    @Override
    public void updateBoard(BoardDTO board) throws Exception {
        boardDAO.updateBoard(board);
    }

    @Override
    public void deleteBoard(int bno) throws Exception {
        boardDAO.deleteBoard(bno);
    }

    @Override
    public int countBoard(Criteria cri) throws Exception {
        return boardDAO.countBoard(cri);
    }

    @Override
    public List<BoardDTO> searchBoard(String bwriter) throws Exception {
        return boardDAO.searchBoard(bwriter);
    }

    @Override
    public BoardDTO heartBoard(int bno) throws Exception {
        return boardDAO.heartBoard(bno);
    }

    @Override
    public void upBoard(int bno) throws Exception {
        boardDAO.upBoard(bno);
    }

    @Override
    public void downBoard(int bno) throws Exception {
        boardDAO.downBoard(bno);
    }

    @Override
    public List<Map<String, Object>> selectFile(int bno) throws Exception {
        return boardDAO.selectFile(bno);
    }

    @Override
    public Map<String, Object> downFile(Map<String, Object> map) throws Exception {
        return boardDAO.downFile(map);
    }
}
