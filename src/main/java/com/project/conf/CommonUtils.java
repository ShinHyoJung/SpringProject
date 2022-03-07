package com.project.conf;

import java.util.UUID;

public class CommonUtils {
    public static String getRandomString() {
        return UUID.randomUUID().toString().replaceAll("-","");
        // 정보 식별을 위해 사용되는 식별자, 128bit 숫자로 이루어짐, 같은채널에서 전송되더라도 식별자가 중복될확률 낮음
    }
}
