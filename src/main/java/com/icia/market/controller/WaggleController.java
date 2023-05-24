package com.icia.market.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/waggle")
public class WaggleController {
    @GetMapping("/save")
    public String saveForm() {
    return "wagglePages/waggleSave";
    }
}
