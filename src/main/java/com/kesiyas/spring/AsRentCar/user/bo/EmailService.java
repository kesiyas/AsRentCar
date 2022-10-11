package com.kesiyas.spring.AsRentCar.user.bo;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class EmailService {

	@Autowired
	private JavaMailSender mailSender;
	  
    //메일 양식 작성
    public String createEmailForm(String email) throws MessagingException, UnsupportedEncodingException {

    	Random random = new Random();
    	int authNum = random.nextInt(888888) + 111111;
    	
        String setFrom = "livingboxc@naver.com";
        String toMail = email;
        String title = "회원가입 인증 번호"; //제목
        String content = "인증번호는 " + authNum + "입니다.";

        MimeMessage message = mailSender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
       
        helper.setFrom(setFrom);
        helper.setTo(toMail);
        helper.setSubject(title);
        helper.setText(content,true);
        
        mailSender.send(message);
        
        return Integer.toString(authNum);
           
    }
    
   
}
