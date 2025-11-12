package com.example.demo;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
    @GetMapping("/")
    public String hello() {
        return "Hello from grafana-springboot-k8s  Native Spring Boot!";
    }
    @PostMapping("/")
    public String hello2() {
        return "Hello from grafana-springboot-k8s  Native Spring Boot!";
    }
    
}