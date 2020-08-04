package com.sinosoft.controller;

import com.sinosoft.entity.UserModel;
import com.sinosoft.service.UserService;
import com.sinosoft.util.Result;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Map;


@Controller
public class IndexController {

    @Autowired
    private UserService service;


    @GetMapping("/login")
    public String tologin() {
        return "login";
    }

    @GetMapping("/home")
    public String home() {
        return "home";
    }

    @GetMapping("/logout")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        // shiro底层删除session的会话信息
        subject.logout();
        return "redirect:login";
    }


    @PostMapping("/login")
    @ResponseBody
    public Map<String, Object> login(String name, String pwd, HttpServletRequest request, HttpSession session) {
        // 使用 shiro 进行登录
        Subject subject = SecurityUtils.getSubject();
        String host = request.getRemoteAddr();
        //获取token
        UsernamePasswordToken token = new UsernamePasswordToken(name, pwd, host);
        try {
            subject.login(token);
            // 登录成功
            UserModel user = (UserModel) subject.getPrincipal();
            session.setAttribute("user", user.getName());
            return Result.ok("0", "/home");
        } catch (UnknownAccountException e) {
            return Result.error("-1", "账号不存在");
        } catch (DisabledAccountException e) {
            return Result.error("-1", "账号异常");
        } catch (AuthenticationException e) {
            return Result.error("-1", "密码错误");
        }
    }

}
