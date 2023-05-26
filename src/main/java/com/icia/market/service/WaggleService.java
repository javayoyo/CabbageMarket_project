package com.icia.market.service;



import com.icia.market.dto.PageDTO;

import com.icia.market.dto.WaggleDTO;
import com.icia.market.dto.WaggleFileDTO;
import com.icia.market.repository.WaggleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class WaggleService {

    @Autowired
    private WaggleRepository waggleRepository;




    public void save(WaggleDTO waggleDTO) throws IOException {
        // 파일 있음, 없음 확인하기
        if(waggleDTO.getBoardFile().get(0).isEmpty()) {
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
            for(MultipartFile boardFile: waggleDTO.getBoardFile()) {
                // 원본 파일 이름 가져오기
                String originalFilename = boardFile.getOriginalFilename();
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
                waggleFileDTO.setBoardId(dto.getId());
                // 로컬에 파일 저장
                // 저장할 경로 설정 (저장할 폴더 + 저장할이름) >> \ 백슬래시 2개로 감싸기 필수
                String savePath = "D:\\springframework_img\\" + storedFileName;
                // 저장처리 > 경로를 통해 저장하겠다
                boardFile.transferTo(new File(savePath));
//    transferTo 오류 발생 시 >  throws IOException 설정하기
                waggleRepository.saveFile(waggleFileDTO);
            }

        }

//        insert 전 > id = null 이므로, 후의 dto 로 진행할것


    }



    public List<WaggleDTO> findAll() {
        return waggleRepository.findAll();
    }

    public void updateHits(Long id) {
        waggleRepository.updateHits(id);
    }

    public WaggleDTO findById(Long id) {
        return waggleRepository.findById(id);
    }

    public void update(WaggleDTO boardDTO) {
        waggleRepository.update(boardDTO);
    }

    public List<WaggleFileDTO> findFile(Long id) {
        return waggleRepository.findFile(id);
    }

    public void delete(Long id) {
        waggleRepository.delete(id);
    }

    public List<WaggleDTO> pagingList(int page) {
        int pageLimit = 3; // 한 페이지에 보여줄 글 갯수
        int pagingStart = (page-1) * pageLimit;
        Map<String, Integer> PagingParams = new HashMap<>();
        PagingParams.put("start", pagingStart);
        PagingParams.put("limit", pageLimit);
        List<WaggleDTO> waggleDTOList = waggleRepository.pagingList(PagingParams);
        return waggleDTOList;
    }
    public PageDTO pagingParam(int page) {
        int pageLimit = 3; // 한페이지에 보여줄 글 갯수
        int blockLimit = 3; // 하단에 보여줄 페이지 번호 갯수(하단 목록 갯수)
        // 전체 글 갯수 조회
        int boardCount = waggleRepository.boardCount();
        // 전체 페이지 갯수 계산 > math.ceil 올림처리
        int maxPage = (int) (Math.ceil((double)boardCount /pageLimit));
        // 시작 페이지 값 계산 ( 1,4,7,10 ~~~ )
        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 마지막 페이지 값 계산 ( 3,6,9,12 ~~ )
        int endPage = startPage + blockLimit -1;
        // 전체 페이지 갯수가 계산한 endPage 보다 작을 때는 endPage 값을 maxPage 값과 같게 세팅
        if(endPage > maxPage) {
            endPage = maxPage;
        }

        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setStartPage(startPage);
        return pageDTO;

    }

    //    사용자가 요청한 검색어 결과에 대한 데이터를 가져오기 > search
    public List<WaggleDTO> searchList(int page, String type, String q) {
        int pageLimit = 3; // 한페이지에 보여줄 글 갯수
        int pagingStart = (page-1) * pageLimit;
        Map<String, Object> pagingParams = new HashMap<>();
        pagingParams.put("start", pagingStart);
        pagingParams.put("limit", pageLimit);
        pagingParams.put("q", q);
        pagingParams.put("type", type);

        List<WaggleDTO> waggleDTOList = waggleRepository.searchList(pagingParams);
        return waggleDTOList;
    }

    public PageDTO pagingSearchParam(int page, String type, String q) {
        int pageLimit = 3; // 한페이지에 보여줄 글 갯수
        int blockLimit = 3; // 하단에 보여줄 페이지 번호 갯수
        Map<String, Object> pagingParams = new HashMap<>();
        pagingParams.put("q", q);
        pagingParams.put("type", type);
        // 전체 글 갯수 조회
        int boardCount = waggleRepository.boardSearchCount(pagingParams);
        // 전체 페이지 갯수 계산
        int maxPage = (int) (Math.ceil((double)boardCount / pageLimit));
        // 시작 페이지 값 계산(1, 4, 7, 10 ~~)
        int startPage = (((int)(Math.ceil((double) page / blockLimit))) - 1) * blockLimit + 1;
        // 마지막 페이지 값 계산(3, 6, 9, 12 ~~)
        int endPage = startPage + blockLimit - 1;
        // 전체 페이지 갯수가 계산한 endPage 보다 작을 때는 endPage 값을 maxPage 값과 같게 세팅
        if (endPage > maxPage) {
            endPage = maxPage;
        }
        PageDTO pageDTO = new PageDTO();
        pageDTO.setPage(page);
        pageDTO.setMaxPage(maxPage);
        pageDTO.setEndPage(endPage);
        pageDTO.setStartPage(startPage);
        return pageDTO;
    }


//    public HeartDTO findHeart(long boardId, long memberId) {
//        // 2개의 parameter를 보내기 위해 Map 선언 및 Map에 데이터 삽입
//        Map<String, Long> number = new HashMap<String, Long>();
//        number.put("boardId", boardId);
//        number.put("memberId", memberId);
//        return boardRepository.findHeart(number);
//    }
//
//    public int insertHeart(HeartDTO heart) {
//        // 좋아요가 DB에 저장이 되는것이 없으면 0이 그대로 리턴으로 넘어감
//        int result = 0;
//        // 좋아요가 이미 있는지 확인하는 코드
//        HeartDTO find = boardRepository.findHeart(heart);
//
//        // find가 null이면 좋아요가 없는 상태이므로 정보 저장
//        // find가 null이 아니면 좋아요가 있는 상태이므로 정보 삭제
//        if(find==null) {
//            // insert의 리턴값은 DB에 성공적으로 insert된 갯수를 보내므로 result가 1이 됨
//            result = boardRepository.insertHeart(heart);
//        } else {
//            boardRepository.deleteHeart(heart);
//        }
//        // 0 or 1이 담겨져서 @Controller에 보냄.
//        return result;
//    }
}

