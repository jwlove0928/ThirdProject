package com.care.WebPage.Common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.ui.Model;

import com.care.WebPage.DTO.Member;

@Aspect
public class MemberAspect {
	@Pointcut("execution(* com..MemberController.isExistId(..))")
	public void isExistIdPC() {}
	@Pointcut("execution(* com..MemberController.reqAuthNum(..))")
	public void reqAuthNumPC() {}
	
	@After("(isExistIdPC() || reqAuthNumPC()) && args(member, model, ..)")
	public void sendMember(Member member, 
			Model model) {
		model.addAttribute("member", member);
	}
}
