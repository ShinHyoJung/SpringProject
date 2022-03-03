package com.project.dao;

import com.project.dto.HeartDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface HeartDAO {

    void insertHeart(HeartDTO heart) throws Exception;

    HeartDTO selectHeart(Map<String, Integer> num) throws Exception;

    void deleteHeart(int hno) throws Exception;

    void updateHeart(HeartDTO heart) throws Exception;
}
