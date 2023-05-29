package com.icia.market.controller;

import com.icia.market.dto.*;
import com.icia.market.service.CommentService;
import com.icia.market.service.WaggleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/waggle")
public class WaggleController {

    @Autowired
    private WaggleService waggleService;

    @Autowired
    private CommentService commentService;


    @GetMapping("/save")
    public String saveForm() {
        return "wagglePages/waggleSave";
    }

    //    @PostMapping("/board/save") // /board/board/save
    @PostMapping("/save") // /board/board/save
    public String save(@ModelAttribute WaggleDTO waggleDTO) throws IOException {
        System.out.println("waggleDTO = " + waggleDTO);
        waggleService.save(waggleDTO);
        return "redirect:/waggle/paging";
    }

//    @GetMapping("/list")
//    public String findAll(Model model) {
//        List<WaggleDTO> waggleDTOList = waggleService.findAll();
//        model.addAttribute("waggleList", waggleDTOList);
//        return "wagglePages/waggleList";
//    }

    @GetMapping("/paging")
    public String paging(@RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "q", required = false, defaultValue = "") String q,
                         @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type,
                         Model model) {
        System.out.println("page = " + page + ", q = " + q);
        List<WaggleDTO> waggleDTOList = null;
        PageDTO pageDTO = null;
//        검색어가 없으면 일반페이징처리, 해당하면 해당건에 대한 페이징처리
        if (q.equals("")) {
            // 사용자가 요청한 페이지에 해당하는 글 목록 데이터
            waggleDTOList = waggleService.pagingList(page);
            // 하단에 보여줄 페이지 번호 목록 데이터  (현재 하단의 숫자 목록 갯수)
            pageDTO = waggleService.pagingParam(page);
        } else {
            waggleDTOList = waggleService.searchList(page, type, q);
            pageDTO = waggleService.pagingSearchParam(page, type, q);
        }
        model.addAttribute("boardList", waggleDTOList);
        model.addAttribute("paging", pageDTO);
        model.addAttribute("q", q);
        model.addAttribute("type", type);
        return "wagglePages/wagglePaging";
    }
    @GetMapping
    public String findById(@RequestParam("id") Long id, Model model,
                           @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                           @RequestParam(value = "q", required = false, defaultValue = "") String q,

                           @RequestParam(value = "type", required = false, defaultValue = "boardTitle") String type)
    {
        waggleService.updateHits(id);
        WaggleDTO waggleDTO = waggleService.findById(id);
        model.addAttribute("board", waggleDTO);
        model.addAttribute("page",page);
        model.addAttribute("q",q);

        model.addAttribute("type",type);


        if (waggleDTO.getFileAttached() == 1) {
            List<WaggleFileDTO> waggleFileDTO = waggleService.findFile(id);
            model.addAttribute("boardFileList", waggleFileDTO);
            System.out.println("waggleFileDTO = " + waggleFileDTO);
        }
        List<CommentDTO> commentDTOList = commentService.findAll(id);
        if (commentDTOList.size() == 0) {
            model.addAttribute("commentList", null);
        } else {
            model.addAttribute("commentList", commentDTOList);
        }
        return "wagglePages/waggleDetail";
    }

    @GetMapping("/update")
    public String updateForm(@RequestParam("id") Long id, Model model) {
        WaggleDTO waggleDTO = waggleService.findById(id);
        model.addAttribute("board", waggleDTO);
        return "wagglePages/waggleUpdate";
    }

    @PostMapping("/update")
    public String update(@ModelAttribute WaggleDTO waggleDTO, Model model) {
        waggleService.update(waggleDTO);
        WaggleDTO dto = waggleService.findById(waggleDTO.getId());
        model.addAttribute("board", dto);
//        return "redirect:/board?id="+boardDTO.getId();
        return "wagglePages/waggleDetail";
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("id") Long id) {
        waggleService.delete(id);
        return "redirect:/waggle/paging";
    }



}
