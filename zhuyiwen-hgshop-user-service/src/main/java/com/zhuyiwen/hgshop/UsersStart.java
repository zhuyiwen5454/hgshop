package com.zhuyiwen.hgshop;

import java.io.IOException;

import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 
 * @author zhuyiwen
 *
 */
public class UsersStart {
	
	public static void main(String[] args) {
		
		System.out.println("用户服务启动中。。。。。。。");
		ClassPathXmlApplicationContext context =
				new ClassPathXmlApplicationContext("classpath:applicationContext-dubbo-provider.xml","classpath:applicationContext-dao.xml");
		System.out.println("用户服务加载完成");
		context.start();
		
		System.out.println(" 商品服务 启动成功！！！");
		
		//加阻塞
		try {
			System.in.read();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
