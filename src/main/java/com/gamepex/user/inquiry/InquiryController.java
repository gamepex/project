package com.gamepex.user.inquiry;

import java.util.Collections;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.gamepex.util.GcsUploader;

@Controller
@RequestMapping("/user/inquiry")
public class InquiryController {

    private final GcsUploader gcsUploader;
    public InquiryController(GcsUploader gcsUploader) { this.gcsUploader = gcsUploader; }

    @GetMapping("/list")
    public String list() {
        return "user/inquiry/list";
    }
    @GetMapping("/write")
    public String write() {
        return "user/inquiry/write";
    }

    @PostMapping("/upload")
    @ResponseBody
    public Map<String, Object> upload(@RequestParam("file") MultipartFile file) throws Exception {
        String url = gcsUploader.upload(file);
        return Collections.singletonMap("location", url);
    }
   
}
