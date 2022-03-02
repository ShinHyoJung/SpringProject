package com.project.service;

import com.project.dao.HeartDAO;
import com.project.dto.HeartDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;

@Service
public class HeartServiceImpl implements HeartService {

    @Autowired
    HeartDAO heartDAO;

    @Override
    public void insertHeart(HeartDTO heart) throws Exception {
        heartDAO.insertHeart(heart);
    }

    @Override
    public HeartDTO selectHeart(int bno, int idx) throws Exception {

        Map<String, Integer> num = new HashMap<String, Integer>();
        num.put("bno", bno);
        num.put("idx", idx);
        return heartDAO.selectHeart(num);
    }

    @Override
    public void deleteHeart(int bno, int idx) throws Exception {

        Map<String, Integer> num = new HashMap<String, Integer>();
        num.put("bno", bno);
        num.put("idx", idx);
        heartDAO.deleteHeart(num);
    }
}
