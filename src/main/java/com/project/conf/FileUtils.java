package com.project.conf;

import com.project.dto.BoardDTO;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.util.*;

/**
 * Created with IntellliJ IDEA.
 * User: nandsoft
 * Date: 2022-03-04
 * Time: 오후 2:31
 * Comments:
 */
@Component("fileUtils")
public class FileUtils {
    private static final String filePath = "D:\\file\\";

    public List<Map<String, Object>> parseInsertFileInfo(BoardDTO board, MultipartHttpServletRequest mpRequest) throws Exception {

        Iterator<String> iterator = mpRequest.getFileNames();

        MultipartFile multipartFile = null;
        String originalFileName = null;
        String originalFileExtension = null;
        String storedFileName = null;

        List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
        Map<String, Object> listMap = null;

        int bno = board.getBno();

        File file = new File(filePath);
        if(file.exists() == false) {
            file.mkdirs();
        }

        while(iterator.hasNext()) {
            multipartFile = mpRequest.getFile(iterator.next());
            if(multipartFile.isEmpty() == false) {
                originalFileName = multipartFile.getOriginalFilename();
                originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));

                file = new File(filePath + storedFileName);
                multipartFile.transferTo(file);
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

}
