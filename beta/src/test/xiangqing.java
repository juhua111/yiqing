package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class xiangqing extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			String province = request.getParameter("province");
			text text = new text();
			org.json.JSONObject xqjson =  text.xq(province);
			response.setCharacterEncoding("UTF-8");
			PrintWriter out = response.getWriter();
			if (xqjson.length()!=0) {
				out.print(xqjson);
			}else {
				out.print(0);
			}
	}

}
