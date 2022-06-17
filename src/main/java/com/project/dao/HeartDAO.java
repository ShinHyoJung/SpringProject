package com.project.dao;

import com.project.vo.Heart;

import java.util.Map;

public interface HeartDAO {

    void insertHeart(Heart heart);

    Heart selectHeart(Map<String, Integer> num);

    void deleteHeart(int hno);

    void updateHeart(Heart heart);
}
