package com.project.service;

import com.project.dao.HeartDAO;
import com.project.dto.HeartDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class HeartServiceImpl implements HeartService {

    @Autowired
    HeartDAO heartDAO;

    @Override
    public void insertHeart(HeartDTO heart) {
        heartDAO.insertHeart(heart);
    }

    @Override
    public HeartDTO selectHeart(int bno, int idx) {
        
        Map<String, Integer> num = new HashMap<>();
        num.put("bno",bno);
        num.put("idx",idx);

        return heartDAO.selectHeart(num);
    }

    @Override
    public void deleteHeart(int hno) {

        heartDAO.deleteHeart(hno);
    }

    @Override
    public void updateHeart(HeartDTO heart) {

        heartDAO.updateHeart(heart);
    }
}
