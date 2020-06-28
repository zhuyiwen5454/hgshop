package com.zhuyiwen.hgshop;

import java.io.IOException;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Bootstart {
	
	@SuppressWarnings("resource")
	public static void main(String[] args) throws IOException {
		System.out.println("商品服务启动服务提供者!");
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("classpath:applicationContext-dao.xml","classpath:applicationContext-dubbo-provider.xml","classpath:applicationContext-kafka.xml");
		System.out.println("启动中...");
		context.start();
		System.out.println("启动成功!");
		//添加阻塞
		System.in.read();
	}
}
