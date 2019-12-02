package com.springboot.news_.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
/*测试一下*/
@Controller
public class HelloWorldController {
    @RequestMapping("/hello")
    public  String sayHello(Model mo){

        mo.addAttribute ("hello","world");
        return "test";


    }



}
