package com.lanou.firstproject;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
@RestController
@RequestMapping("/")

public class FirstProjectApplication {
	public  static Map<String,String> map=new HashMap<>();
	public static void main(String[] args) {
		SpringApplication.run(FirstProjectApplication.class, args);
		System.out.println(map);
	}
	@RequestMapping("/valReg")
	public @ResponseBody String  valReg(String acc){
		if(map.containsKey(acc)){
			return "true";
		}else{
			return "false";
		}

	}
	@RequestMapping("/reg")
	public @ResponseBody String  register(String acc,String pwd){
		if(!map.containsKey(acc)){
			map.put(acc,pwd);
			return "true";
		}else{
			return "false";
		}
	}
	@RequestMapping("/log")
	public  String  login(String acc,String pwd){
		if(acc==""&&pwd==""){
			return map.toString();
		}else{
			if(map.containsKey(acc)){
				if(map.get(acc).equals(pwd)){
					return acc+"："+pwd;
				}else{
					return "登录信息有误！";
				}
			}else{
				return "登录信息有误！";
			}


		}

	}
}
