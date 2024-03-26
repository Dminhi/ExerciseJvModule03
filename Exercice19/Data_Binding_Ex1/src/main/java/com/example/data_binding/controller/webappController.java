package com.example.data_binding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class webappController {
    @GetMapping("/")
    public String display() {
        return "webapp";
    }
}
