package com.kh.mt.member.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.member.model.sevice.MemberService;
import com.kh.mt.member.model.vo.Member;

@Controller
public class MemberController {
	@Autowired
	MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value="showLoginPage.me")
	public String showLoginPage() {
		
		return "member/Login";
	}

	@RequestMapping(value="showJoinPage1.me")
	public String showJoinPage1() {
		
		return "member/Join1";
	}
	@RequestMapping(value="showJoinPage2.me")
	public String showJoinPage2() {
		
		return "member/Join2";
	}
	//로그인 체크
	@RequestMapping(value="loginCheck.me")
	public ModelAndView loginCheck(Member m,ModelAndView mv,SessionStatus status) {
		Member loginUser= ms.loginCheck(m);
		mv.addObject("loginUser", loginUser);
		status.setComplete();
		
		mv.setViewName("main/main");
		return mv;
	}
	
	//로그아웃
	@RequestMapping(value="logout.me", method=RequestMethod.GET)
	public String logout(SessionStatus status){
		status.setComplete();
		return "main/main";
	}
	//회원가입
	@RequestMapping(value="joinMember.me")
	public String insertMeber(Member m,Model model) {
		if(m.getAccount1().equals("003")){
			m.setAccount("기업은행"+m.getAccount2());
		}else if(m.getAccount1().equals("004")){
			m.setAccount("국민은행"+m.getAccount2());
		}else if(m.getAccount1().equals("020")){
			m.setAccount("우리은행"+m.getAccount2());
		}else if(m.getAccount1().equals("088")){
			m.setAccount("신한은행"+m.getAccount2());
		}else if(m.getAccount1().equals("081")){
			m.setAccount("KEB하나은행"+m.getAccount2());
		}else if(m.getAccount1().equals("012")){
			m.setAccount("농협은행"+m.getAccount2());
		}else if(m.getAccount1().equals("007")){
			m.setAccount("수협"+m.getAccount2());
		}else if(m.getAccount1().equals("048")){
			m.setAccount("신협"+m.getAccount2());
		}else if(m.getAccount1().equals("034")){
			m.setAccount("광주은행"+m.getAccount2());
		}else if(m.getAccount1().equals("032")){
			m.setAccount("부산은행"+m.getAccount2());
		}else if(m.getAccount1().equals("031")){
			m.setAccount("대국은행"+m.getAccount2());
		}else if(m.getAccount1().equals("071")){
			m.setAccount("우체국"+m.getAccount2());
		}
		m.setmPwd(passwordEncoder.encode(m.getmPwd()));
		ms.insertMember(m);
		System.out.println("Member : "+m);
		return "member/Login";
	}
	
	//Id 중복확인
	@RequestMapping(value="overlapCheck.me")
	public void overlapCheck(@RequestParam("mId") String mId,HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		String DBuserId = ms.overlapCheck(mId);
			try {
				if(mId.equals(DBuserId)){
				response.getWriter().print("중복됩니다. 다시입력해주세요");
				}else{
					response.getWriter().print("사용가능한 ID입니다.");
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
	}
	//이메일 인증 
	@RequestMapping(value="certiEmail.me")
	public void certiEmail(@RequestParam("email") String email,HttpServletResponse response ) {
		String key = "pwd";
		String number = connectEmail(email);
		try {
			response.getWriter().print(number);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//이메일 인증 메일 보내기
	public String connectEmail(String email) {
		String to1 = email;
		String host = "smtp.naver.com";
		String subject = "발급된 인증번호입니다.";
		String fromName = "모두의TV 관리자";
		String from = "ekdbs1220@naver.com";
		String authNum = authNum();
		String content = "인증번호는 [" + authNum + "]입니다. 사이트로 돌아가서 입력해주세요";

		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", "465");
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");

			Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("ekdbs1220@naver.com", "dan2353"); // gmail계정
				}
			});

			Message msg = new MimeMessage(mailSession);

			InternetAddress[] address1 = { new InternetAddress(to1) };
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "utf-8", "B")));
			msg.setRecipients(Message.RecipientType.TO, address1); // 받는사람 설정
			msg.setSubject(subject); // 제목설정
			msg.setSentDate(new java.util.Date());
			msg.setContent(content, "text/html; charset=utf-8"); // 내용설정

			Transport.send(msg); // 메일보내기
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return authNum;

	}

	//이메일 인증 난수 만들기
	public static String authNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0; i <= 5; i++) {
			int num = (int) (Math.random() * 9 + 1);
			buffer.append(num);
		}
		return buffer.toString();
	}
}
