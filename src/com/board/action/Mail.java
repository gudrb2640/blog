package com.board.action;

import java.util.Properties;

import javax.mail.*;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.AddressException;
import javax.mail.internet.MimeMessage;

public class Mail {
	public void naverMailSend(String title,String text,String address) {
		String host = "smtp.naver.com";
		String user = "industry1111@naver.com";
		String password = "rkswl940**";

		Properties props = new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.prot",465);
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.ssl.enable","true");
		props.put("mail.smtp.ssl.trust","smtp.naver.com");

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, password);
			}
			});
			
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(address));
			message.setSubject(title);
			message.setText(text);
			Transport.send(message);
		} catch (Exception e) {
			System.out.println("naverMailSend:"+e.toString());
		}
	}
}