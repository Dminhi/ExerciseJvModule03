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
public class CalculatorController {
    @GetMapping
    public String home(){
        return "customer/home";
    }
    @PostMapping
    public String display(
            @RequestParam(name = "number1") String number1,
            @RequestParam(name = "number2") String number2,
            @RequestParam(name = "Calculate") String Calculate, Model model) {
        int result;
        switch (Calculate) {
            case "Addition":
                result= Integer.parseInt(number1)+Integer.parseInt(number2);
                model.addAttribute("Calculate","Addition");
                break;
            case "Subtraction":
                result= Integer.parseInt(number1)-Integer.parseInt(number2);
                model.addAttribute("Calculate","Subtraction");

                break;
            case "Multiplication":
                result= Integer.parseInt(number1)*Integer.parseInt(number2);
                model.addAttribute("Calculate","Multiplication");

                break;
            case "Division":
                result= Integer.parseInt(number1)/Integer.parseInt(number2);
                model.addAttribute("Calculate","Division");

                break;
            default:
                result =0;
        }
        model.addAttribute("result",result);

        return "customer/home";
    }
}
