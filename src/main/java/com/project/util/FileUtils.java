package com.project.util;

import com.project.dto.BoardDTO;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.util.*;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-03-04
 * Time: 오후 2:31
 * Comments:
 */
@Component("fileUtils")
public class FileUtils { // 첨부파일 정보를 이용해 설정을 하는 클래스
    private static final String filePath = "D:\\file\\"; // 상수로 값이 고정됨

    public List<Map<String, Object>> parseInsertFileInfo(BoardDTO board, MultipartHttpServletRequest mpRequest) throws Exception { // 스프링이 제공하는 파일 업로드 인터페이스
        // mpRequest는 첨부파일의 파라미터 값을 받을 수 있음
        Iterator<String> iterator = mpRequest.getFileNames(); // 리스트를 저장하기위한 컬렉션 프레임워크 인터페이스

        MultipartFile multipartFile = null; // 사용자가 업로드한 파일을 핸들러에서 손쉽게 다룰 수 있도록 도와주는 handler 매개변수 중 하나
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>(); // 묶은 해시값을 리스트에 넣음
        Map<String, Object> listMap = null; // 파일이 여러개이므로 하나의 값으로 묶음

        int bno = board.getBno();

        File file = new File(filePath);
        if(file.exists() == false) {
            file.mkdirs(); // 디렉토리가 존재하지않으면 경로에 디렉토리만듬
        }

        while(iterator.hasNext()) { // 값이 없어서 false가 나올때까지 값을 계속 받음
            multipartFile = mpRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false) {
                originalFileName = multipartFile.getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = CommonUtils.getRandomString() + originalFileExtension;


                file = new File(filePath + storedFileName);
                multipartFile.transferTo(file); // 받은 파일을 destination file로 변환
                listMap = new HashMap<String, Object>();
                listMap.put("bno", bno);
                listMap.put("org_fname", originalFileName);
                listMap.put("stored_fname", storedFileName);
                listMap.put("fsize", multipartFile.getSize());
                list.add(listMap);
            }
        }
        return list;
    }

    public List<Map<String, Object>> parseUpdateFileInfo(BoardDTO board, String[] files, String[] fileNames, MultipartHttpServletRequest mpRequest) throws IOException {

        Iterator<String> iterator = mpRequest.getFileNames();
        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Map<String, Object> listMap = null;

        int bno = board.getBno();

        while(iterator.hasNext()) {
            multipartFile = mpRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false) {
                originalFileName = multipartFile.getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
                storedFileName = CommonUtils.getRandomString() + originalFileExtension;
                multipartFile.transferTo(new File(filePath + storedFileName));

                listMap = new HashMap<String, Object>();

                listMap.put("bno", bno);
                listMap.put("org_fname", originalFileName);
                listMap.put("stored_fname", storedFileName);
                listMap.put("fsize", multipartFile.getSize());
                listMap.put("IS_NEW", "Y");
                list.add(listMap);
            }
        }
        if(files != null && fileNames != null) {
            for(int i=0; i<fileNames.length; i++) {
                listMap = new HashMap<String, Object>();
                listMap.put("IS_NEW", "N");
                listMap.put("fno", files[i]);
                list.add(listMap);
            }
        }
        return list;
    }
}
