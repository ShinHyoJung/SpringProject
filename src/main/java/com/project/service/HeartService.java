package com.project.service;

import com.project.vo.Heart;

public interface HeartService {

    void insertHeart(Heart heart);

    Heart selectHeart(int bno, int idx);

    void deleteHeart(int hno);

    void updateHeart(Heart heart);

}
