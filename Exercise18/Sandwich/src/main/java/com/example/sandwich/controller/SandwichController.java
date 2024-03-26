package com.example.sandwich.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class SandwichController {

    @GetMapping
    public String save(Model model) {
        List<String> condiment = new ArrayList<>();
        condiment.add("Lettuce");
        condiment.add("Tomato");
        condiment.add("Mustard");
        condiment.add("Sprouts");
        model.addAttribute("condiment",condiment);
        return "customer/Home";
    }
    @PostMapping
    public String display(
            @RequestParam(name = "condiment") List<String> condiment, Model model){
        model.addAttribute("condiment",condiment);
        return "customer/display";
    }
}
