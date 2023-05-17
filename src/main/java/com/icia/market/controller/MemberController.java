package com.icia.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MemberController {

    @GetMapping("/member/gogleLogin")
    public String gogleLogin () {
        return "/memberPages/gogleLogin";
    }
}
