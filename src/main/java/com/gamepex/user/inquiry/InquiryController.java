package com.gamepex.user.inquiry;

import org.springframework.security.access.method.P;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/inquiry")
public class InquiryController {
    @GetMapping("/list")
    public String list() {
        return "user/inquiry/list";
    }
    @GetMapping("/write")
    public String write() {
        return "user/inquiry/write";
    }

    // @PostMapping("/upload")
    // public String upload() {
        
    // }
}