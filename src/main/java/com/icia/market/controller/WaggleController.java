package com.icia.market.controller;

import com.icia.market.dto.WaggleDTO;
import com.icia.market.service.WaggleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.IOException;

@Controller
@RequestMapping("/waggle")
public class WaggleController {
    @Autowired
    private WaggleService waggleService;

    @GetMapping("/save")
    public String saveForm() {
        return "wagglePages/waggleSave";
    }


    @PostMapping("/save")
    public String save(@ModelAttribute WaggleDTO waggleDTO) throws IOException {
        System.out.println("waggleDTO = " + waggleDTO);
        waggleService.save(waggleDTO);
        return "redirect:/waggle/paging";

    }

}
