package com.kh.mt.common;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class AfterAdvice {
	@Pointcut("execution(* com.kh.tsp..*ServiceImpl.*(..))")
	public void allPointcut(){}
	
	@After("allPointcut()")
	public void finallyLog(){
		//예외 발생 여부에 상관없이 무조건 수행되는 어드바이스임
		System.out.println("트랜잭션 처리 완료");
		 
	}
	
}
