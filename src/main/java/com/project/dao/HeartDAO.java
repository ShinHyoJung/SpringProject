package com.project.dao;

import com.project.dto.HeartDTO;

import java.util.Map;

public interface HeartDAO {

    HeartDTO selectHeart(Map<String, Integer> number) throws Exception;
}
