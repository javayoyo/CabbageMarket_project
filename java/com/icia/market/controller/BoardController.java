package com.icia.market.controller;

import com.icia.market.dto.*;
import com.icia.market.service.BoardService;
import com.icia.market.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private CommentService commentService;


    @GetMapping("/save")
    public String saveForm() {
        return "boardPages/boardSave";
    }

    //    @PostMapping("/board/save") // /board/board/save
    @PostMapping("/save") // /board/board/save
    public String save(@ModelAttribute BoardDTO boardDTO) throws IOException {
        System.out.println("boardDTO = " + boardDTO);
        boardService.save(boardDTO);
        return "redirect:/board/paging";

    }


//    @GetMapping("/list")
//    public String findAll(Model model) {
//        List<BoardDTO> boardDTOList = boardService.findAll();
//        model.addAttribute("boardList", boardDTOList);
//        return "boardPages/boardList";
//    }

    @GetMapping("/paging")
    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "q", required = false, defaultValue = "") String q,
                         @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                         Model model) {
        System.out.println("page = " + page + ", q = " + q);
        List<BoardDTO> boardDTOList = null;
        PageDTO pageDTO = null;
//        검색어가 없으면 일반페이징처리, 해당하면 해당건에 대한 페이징처리
        if (q.equals("")) {
            // 사용자가 요청한 페이지에 해당하는 글 목록 데이터
            boardDTOList = boardService.pagingList(page);
            // 하단에 보여줄 페이지 번호 목록 데이터  (현재 하단의 숫자 목록 갯수)
            pageDTO = boardService.pagingParam(page);
        } else {
            boardDTOList = boardService.searchList(page, type, q);
            pageDTO = boardService.pagingSearchParam(page, type, q);
        }
        model.addAttribute("boardList", boardDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        return "boardPages/boardPaging";
    }
    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           @RequestParam(value = "q", required = false, defaultValue = "") String q,

                           @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type)
    {
        boardService.updateHits(id);
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        model.addAttribute("page",page);
        model.addAttribute("q",q);
        model.addAttribute("type",type);


        if (boardDTO.getFileAttached() == 1) {
            List<BoardFileDTO> boardFileDTO = boardService.findFile(id);
            model.addAttribute("boardFileList", boardFileDTO);
            System.out.println("boardFileDTO = " + boardFileDTO);
        }
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        if (commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }
        return "boardPages/boardDetail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        BoardDTO boardDTO = boardService.findById(id);
        model.addAttribute("board", boardDTO);
        return "boardPages/boardUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute BoardDTO boardDTO, Model model) {
        boardService.update(boardDTO);
        BoardDTO dto = boardService.findById(boardDTO.getId());
        model.addAttribute("board", dto);
//        return "redirect:/board?id="+boardDTO.getId();
        return "boardPages/boardDetail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        boardService.delete(id);
        return "redirect:/board/paging";
    }

//    @GetMapping("/heart")
//    public String detail(@RequestParam("boardId") long boardId, Model model, @RequestParam(value="page", required=false, defaultValue="1")int page, @RequestParam("memberId") long memberId) {
//
//        BoardDTO board = boardService.findById(boardId);
//        model.addAttribute("board", board);
//        model.addAttribute("page", page);
//
//        // 아래부터 좋아요 기능 시 추가되는 부분
//
//        HeartDTO heart = new HeartDTO();
//        // 좋아요가 되있는지 찾기위해 게시글번호와 회원번호를 보냄.
//        heart = boardService.findHeart(boardId, memberId);
//        // 찾은 정보를 heart로 담아서 보냄
//        model.addAttribute("heart",heart);
//        return "boardPages/boardDetail";
//    }
//
//    @PostMapping("/heart")
//    public @ResponseBody int heart(@ModelAttribute HeartDTO heart) {
//        int result = boardService.insertHeart(heart);
//        return result;
//    }





}