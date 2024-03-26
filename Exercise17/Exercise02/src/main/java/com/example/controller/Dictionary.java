package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.Map;

@Controller
public class Dictionary {
    public static final Map<String,String> translate = new HashMap<>();
    static {
        translate.put("home","nhà");
        translate.put("family","gia đình");
        translate.put("money","tiền");
    }
    @GetMapping
    public String Home(){
        return "Dictionary";
    }
    @PostMapping
    public String Translate(@RequestParam String searchTerm, Model model){
        String vietnamese = translate.get(searchTerm) ;
        model.addAttribute("result",vietnamese);
        return "Dictionary";
    };
}
