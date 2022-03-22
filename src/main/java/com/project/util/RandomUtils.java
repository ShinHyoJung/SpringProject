package com.project.util;

import java.util.UUID;

public class RandomUtils {
    public static String getRandomString() {
        return UUID.randomUUID().toString().replaceAll("-","");
        // 정보 식별을 위해 사용되는 식별자, 128bit 숫자로 이루어짐, 같은채널에서 전송되더라도 식별자가 중복될확률 낮음
        // 사용을 많이할수록 중복확률이 올라가지만, 프로젝트특성상 충분히 uuid로 중복이 안되게 가능
    }
}
