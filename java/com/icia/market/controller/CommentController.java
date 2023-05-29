package com.icia.market.controller;

import com.icia.market.dto.CommentDTO;
import com.icia.market.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/comment")
public class CommentController {
    @Autowired
    private CommentService commentService;

    @PostMapping("/save")
    public ResponseEntity save(@ModelAttribute CommentDTO commentDTO) {
        System.out.println("commentDTO = " + commentDTO);
        commentService.save(commentDTO);
        List<CommentDTO> commentDTOList = commentService.findAll(commentDTO.getBoardId());
        return new ResponseEntity<>(commentDTOList, HttpStatus.OK);
    }

    @GetMapping("/comment_delete")
    public String delete(@RequestParam("id") Long id,
                         @RequestParam(value = "page", required = false, defaultValue = "1") int page,
                         @RequestParam(value = "q", required = false, defaultValue = "") String q,
                         @RequestParam(value = "type",required = false, defaultValue = "boardTitle") String type,
                         @RequestParam("boardId") Long boardId){
        System.out.println("id = " + id);
        System.out.println("boardId = " + boardId);
        commentService.delete(id);
        System.out.println("id = " + id);

        return "redirect:/board/paging?boardId=" + boardId + "&page=" + page + "&q="+ q +"&type="+type;
    }



}















