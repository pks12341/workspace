package com.yedam.app.spring;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class SpringMainClass {

	public static void main(String[] args) {
		System.out.println("Spring 방식");
		ApplicationContext
		ctx = new GenericXmlApplicationContext("classpath:applicationContext.xml");
		
		
		TV tv = (TV)ctx.getBean(TV.class);
		tv.on();  //자바와 다르게 인스턴스 생성하는 과정이 없다?
		
		
	}
}