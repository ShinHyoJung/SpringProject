package com.project.dto;

import java.util.Random;

public class TempKey { //이메일 인증코드 난수화

    private boolean lowerCheck;
    private int size;

    public String getKey(int size, boolean lowerCheck) {
        this.size = size;
        this.lowerCheck = lowerCheck;
        return init();
    }

    private String init() {
        Random random = new Random();
        StringBuffer sb = new StringBuffer();
        int num = 0;
        do {
            num = random.nextInt(75) + 48; // 랜덤으로 수를 받음
            if((num >= 48 && num <= 57) || (num >=65 && num<=90) || (num>=97 && num<=122)) {
                sb.append((char)num); // 아스키코드를 통해 문자로 만듬
            }
        } while (sb.length() < size); // 사이즈만큼 문자열을 채운다
        if(lowerCheck) {
            return sb.toString().toLowerCase(); // 소문자로 만든다.
        }
        return sb.toString(); // 문자로 반환.
    }
}
