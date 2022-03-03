package com.project.service;

import com.project.dto.HeartDTO;

import java.util.Map;

public interface HeartService {

    void insertHeart(HeartDTO heart) throws Exception;

    HeartDTO selectHeart(int bno, int idx) throws Exception;

    void deleteHeart(int hno) throws Exception;

    void updateHeart(HeartDTO heart) throws Exception;

}
