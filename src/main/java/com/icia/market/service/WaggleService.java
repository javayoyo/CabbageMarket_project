package com.icia.market.service;

import com.icia.market.dto.WaggleDTO;
import com.icia.market.dto.WaggleFileDTO;
import com.icia.market.repository.WaggleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
public class WaggleService {

    @Autowired
    private WaggleRepository waggleRepository;

    public void save(WaggleDTO waggleDTO) throws IOException {
        // 파일 있음, 없음 확인하기
        if(waggleDTO.getWaggleFile().get(0).isEmpty()) {
            // 파일 없음
            System.out.println("파일없음");
            waggleDTO.setFileAttached(0);
            waggleRepository.save(waggleDTO);
        }else {
            // 파일 있음
   /*
   1. 파일첨부 여부 값 1로 세팅하고 DB에 제목 등 내용 board_table에 저장처리
     2. 파일의 이름을 가져오고 DTO 필드값에 세팅
     3. 저장용 파일 이름 만들고 DTO 필드값에 세팅
     4. 로컬에 파일 저장
     5. board_file_table 에 저장 처리
     */
            System.out.println("파일있음");
            waggleDTO.setFileAttached(1);
            WaggleDTO dto = waggleRepository.save(waggleDTO);
            for(MultipartFile waggleFile: waggleDTO.getWaggleFile()) {
                // 원본 파일 이름 가져오기
                String originalFilename = waggleFile.getOriginalFilename();
                System.out.println("originalFilename = " + originalFilename);
                //저장용 이름 만들기
                System.out.println(System.currentTimeMillis());
                System.out.println(UUID.randomUUID().toString());
                String storedFileName = System.currentTimeMillis() + "-" + originalFilename;
                System.out.println("storedFileName = " + storedFileName);
                // 저장을 위한 BoardFileDTO 세팅
                WaggleFileDTO waggleFileDTO = new WaggleFileDTO();
                waggleFileDTO.setOriginalFileName(originalFilename);
                waggleFileDTO.setStoredFileName(storedFileName);
                waggleFileDTO.setWaggleId(dto.getId());
                // 로컬에 파일 저장
                // 저장할 경로 설정 (저장할 폴더 + 저장할이름) >> \ 백슬래시 2개로 감싸기 필수
                String savePath = "D:\\springframework_img\\" + storedFileName;
                // 저장처리 > 경로를 통해 저장하겠다
                waggleFile.transferTo(new File(savePath));
//    transferTo 오류 발생 시 >  throws IOException 설정하기
                waggleRepository.saveFile(waggleFileDTO);
            }

        }

//        insert 전 > id = null 이므로, 후의 dto 로 진행할것


    }
}
