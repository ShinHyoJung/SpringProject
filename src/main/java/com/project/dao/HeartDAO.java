package com.project.dao;

import com.project.dto.HeartDTO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface HeartDAO {

    void insertHeart(HeartDTO heart);

    HeartDTO selectHeart(Map<String, Integer> num);

    void deleteHeart(int hno);

    void updateHeart(HeartDTO heart);
}
