/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.dolphin.hostelmanagement.utils;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.File;
import java.net.URI;
import java.util.Properties;

public class EmailService {

    private String username = "nguyenmykhanhvy@gmail.com"; //base mail of our website
    private String password = "jgjzcxlxpoaegckc";

    private Properties prop;

    private String gmailHost = "smtp.gmail.com";
    private int gmailPort = 587;
    
    public EmailService() {} //base email type will be gmail

    public EmailService(String host, int port) {
        prop = new Properties();
        prop.put("mail.smtp.host", host);
        prop.put("mail.smtp.port", port);
    }

    /*public static void main(String... args) {
        try {
            new EmailService("smtp.gmail.com", 587, "nguyenmykhanhvy@gmail.com", "jgjzcxlxpoaegckc")
              .sendMail();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }*/
    
    private void init() {
        prop = new Properties();
        prop.put("mail.smtp.auth", true);
        prop.put("mail.smtp.starttls.enable", "true");
        prop.put("mail.smtp.host", gmailHost);
        prop.put("mail.smtp.port", gmailPort);
        prop.put("mail.smtp.ssl.trust", gmailHost);
    }

    public void sendMail(String toEmail, String pwd) throws Exception {
        init();
        Session session = Session.getInstance(prop, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress("from@gmail.com")); //mail LocND: LocNDSE160199@fpt.edu.vn, LocVH: locvhse160453@fpt.edu.vn
        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));
        message.setSubject("Mail Subject");

        String msg = "Hello " + toEmail + "! This is a reset password message sent from Sakura Hostel Management system. "
                + "This is your new password: " + pwd + "<br>If you think this is a mistake, ignore the mail!";

        MimeBodyPart mimeBodyPart = new MimeBodyPart();
        mimeBodyPart.setContent(msg, "text/html; charset=utf-8");

        //String msgStyled = "This is my <b style='color:red;'>bold-red email</b> using JavaMailer";
        //MimeBodyPart mimeBodyPartWithStyledText = new MimeBodyPart();
        //mimeBodyPartWithStyledText.setContent(msgStyled, "text/html; charset=utf-8");

        //MimeBodyPart attachmentBodyPart = new MimeBodyPart();

        //attachmentBodyPart.attachFile(getFile());

        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(mimeBodyPart);
        //multipart.addBodyPart(mimeBodyPartWithStyledText);
        //multipart.addBodyPart(attachmentBodyPart);
        System.out.println("????");
        message.setContent(multipart);

        Transport.send(message);
    }

    private File getFile() throws Exception {
        URI uri = this.getClass()
          .getClassLoader()
          .getResource("attachment.txt")
          .toURI();
        return new File(uri);
    }

}
