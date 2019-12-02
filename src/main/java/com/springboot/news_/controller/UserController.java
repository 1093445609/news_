package com.springboot.news_.controller;

import com.springboot.news_.entity.NewsUser;
import com.springboot.news_.serviceDao.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    @RequestMapping("/list")
    public String FindUserController(Model model){
        List<NewsUser> list = userService.FindAll ();
        model.addAttribute ("list",list);
        return "list";

    }



}
