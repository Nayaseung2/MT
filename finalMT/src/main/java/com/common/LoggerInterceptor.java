package com.common;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.mt.member.model.vo.Member;

public class LoggerInterceptor extends HandlerInterceptorAdapter{
	protected Log log = LogFactory.getLog(LoggerInterceptor.class);
	private ArrayList<String> list = new ArrayList<String>();
	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
        Member loginUser = (Member)request.getSession().getAttribute("loginUser");
		
		if (log.isDebugEnabled() && !list.contains(request.getSession().getId())) {
			list.add(request.getSession().getId());
        	String userId = "gost";
        	
			if(loginUser != null){
        		userId = loginUser.getmId();
        	}
        	
			log.debug("[" + userId + "] [접속]");
        
		}
        return super.preHandle(request, response, handler);
    }


}
