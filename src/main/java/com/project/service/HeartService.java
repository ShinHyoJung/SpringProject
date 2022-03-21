package com.project.service;

import com.project.dto.HeartDTO;

import java.util.Map;

public interface HeartService {

    void insertHeart(HeartDTO heart);

    HeartDTO selectHeart(int bno, int idx);

    void deleteHeart(int hno);

    void updateHeart(HeartDTO heart);

}
