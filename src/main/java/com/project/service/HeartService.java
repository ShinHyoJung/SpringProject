package com.project.service;

import com.project.dto.HeartDTO;

import java.util.Map;

public interface HeartService {

    HeartDTO selectHeart(Map<String, Integer> number) throws Exception;

}
