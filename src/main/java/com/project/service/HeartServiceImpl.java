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
    public HeartDTO selectHeart(Map<String, Integer> number) throws Exception {
        return heartDAO.selectHeart(number);
    }
}
