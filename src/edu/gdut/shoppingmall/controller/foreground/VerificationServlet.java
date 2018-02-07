package edu.gdut.shoppingmall.controller.foreground;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import edu.gdut.shoppingmall.common.VerificationCode;

public class VerificationServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 45478321695L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
			throws ServletException, IOException {
		
		 resp.setContentType("image/jpeg");
		 resp.setHeader("Pragma", "no-cache");
		 resp.setHeader("Cache-Control", "no-cache");
		 resp.setDateHeader("Expires", 0);
		 
		 VerificationCode vCode = new VerificationCode(140,34,4,8);
		 HttpSession session = req.getSession();
		 session.setAttribute("code", vCode.getCode());
		 vCode.write(resp.getOutputStream());
	 
	}
	
}
