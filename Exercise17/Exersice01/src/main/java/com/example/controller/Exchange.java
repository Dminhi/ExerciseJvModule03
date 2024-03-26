package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class Exchange {
    @GetMapping()
    public String home(){
        return "MoneyExchange";
    }
    @PostMapping("/Exchange")
    public String MoneyExchange(@RequestParam String usd, Model model){
        double USD = Double.parseDouble(usd);
        double vnd= USD * 24500;
        model.addAttribute("Money",vnd);
        return "MoneyExchange";
    }

}
