package com.kh.mt.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.mt.JDBC.model.vo.JDBC;
import com.kh.mt.member.model.sevice.MemberService;
import com.kh.mt.member.model.vo.Member;
import com.kh.mt.member.model.vo.NaverLoginMember;

@Controller
public class MemberController {
	@Autowired
	MemberService ms;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	//메인페이지로 가기
	@RequestMapping(value="showMainPage.me")
	public String showshowMainPage() {

		return "main/main";
	}
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
	public ModelAndView loginCheck(Member m,ModelAndView mv,SessionStatus status,HttpServletRequest request) {
		Member loginUser= ms.loginCheck(m);
		mv.addObject("loginUser", loginUser);
		HttpSession session =request.getSession();
		session.setAttribute("loginUser", loginUser);
		mv.setViewName("main/main");
		return mv;
	}

	//로그아웃
	@RequestMapping(value="logout.me", method=RequestMethod.GET)
	public String logout(SessionStatus status,HttpServletRequest request){
		//status.setComplete();
		request.getSession().invalidate();
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
		//방송국 생성
		String mid=m.getmId();
		ms.insertJDBCStation(mid);
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

	//네이버 로그인
	@RequestMapping(value="naverLogin.me")
	public ModelAndView naverLogin(ModelAndView mv,SessionStatus status,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		Member m=null;
		Member m1=null;
		String clientId = "fEGqjOAbb6lpxv2QAw23";
		String clientSecret = "Kbc33qwgbM";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:8001/p/naverLogin", "UTF-8");
		String apiURL;
		apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
		apiURL += "client_id=" + clientId;
		apiURL += "&client_secret=" + clientSecret;
		apiURL += "&redirect_uri=" + redirectURI;
		apiURL += "&code=" + code;
		apiURL += "&state=" + state;
		String token=null;
		String[] arrtoken =null;
		int check1=0;

		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			check1=responseCode;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			while ((inputLine = br.readLine()) != null) {
				token+=inputLine;
			}
			br.close();

		} catch (Exception e) {
			System.out.println(e);
		}

		arrtoken = token.split("\"");
		String actoken= arrtoken[3];
		String retoken=  arrtoken[7];
		//1차 로그인 판별
		if(check1==200) {

			String token1 = actoken;// 네이버 로그인 접근 토큰;
			String header = "Bearer " + token1; // Bearer 다음에 공백 추가
			String[] arrprofile = null;
			String profile="";
			try {
				String apiURL1 = "https://openapi.naver.com/v1/nid/me";
				URL url = new URL(apiURL1);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				con.setRequestProperty("Authorization", header);
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if(responseCode==200) { // 정상 호출
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {  // 에러 발생
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				// StringBuffer response1 = new StringBuffer();
				while ((inputLine = br.readLine()) != null) {
					profile+=inputLine;
				}
				br.close();

			} catch (Exception e) {
				System.out.println(e);
			}
			if(!actoken.equals("invalid_request")) {
				arrprofile = profile.split("\"");
				String message=arrprofile[7];

				int idnum1 = profile.indexOf("\"id\":");
				String id1 =profile.substring(idnum1+6);

				int idnum2 = id1.indexOf("\"");
				String id = id1.substring(0,idnum2);

				int enum1 = profile.indexOf("\"email\":");
				String email1 =profile.substring(enum1+9);

				int enum2 = email1.indexOf("\"");
				String email = email1.substring(0,enum2);
				int ename1=email.indexOf("@");
				String ename=email.substring(0,ename1);
				NaverLoginMember nlm=new NaverLoginMember(id,email,ename);
				m =ms.selectOne(email);
				if(m!=null){
					mv.addObject("loginUser",m);
					status.setComplete();
					mv.setViewName("main/main");
				}else{
					ms.insertNaverMember(nlm);
					m1=ms.selectOne(email);
					mv.addObject("loginUser",m1);
					status.setComplete();
					mv.setViewName("main/main");
				}

				Member m2=null;
				m2 =ms.selectOne(email);
				HttpSession session = request.getSession();
				session.setAttribute("loginUser", m2);
			}
		}

		return mv;
	}



	/*==================================================*/


	// 아이디 찾기 페이지로 이동
	@RequestMapping(value="findId.me")
	public String showFindIdPage() {

		return "member/findId";
	}

	// 이메일로 아이디 전송
	@RequestMapping(value="findIdEmail.me")
	public ModelAndView findIdEmail(HttpServletResponse response, ModelAndView mv, 
			String joinName, String joinEmail) {

		// 입력받은 이름과 이메일로 아이디 조회
		String nameId = ms.checkNameId(joinName);
		String emailId = ms.checkEmailId(joinEmail);

		try {

			// 조회해온 아이디가 일치하면 메일발송
			if(nameId.equals(emailId)) {

				String to1 = joinEmail;
				String host = "smtp.naver.com";
				String subject = "모두의 TV 아이디 찾기 결과입니다.";
				String fromName = "모두의TV 관리자";
				String from = "ekdbs1220@naver.com";
				String content = "찾으시는 ID는 [" + nameId + "]입니다.";


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
				
				mv.addObject("success");

			} else {

				mv.addObject("fail");
			}

		} catch(Exception e) {

			e.printStackTrace();
		}

		mv.setViewName("jsonView");

		return mv;
	}














}
