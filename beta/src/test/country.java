package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

public class country extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			ApiClient_country apiClient;
			String string = null;
			try {
				apiClient = new ApiClient_country();
				string = apiClient.test();
				apiClient.destoy();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			String string2 = null;
			ApiClient_spreadQuery apiClient2;
			try {
				apiClient2 = new ApiClient_spreadQuery();
				string2=apiClient2.test();
				apiClient2.destoy();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			text text = new text();
			org.json.JSONObject tripQuery = text.aa("https://gw.m.163.com/nc/api/v1/feed/static/h5-normal-list?start=0&size=100&tid=T1582287839597&t=316855334852");//实时播报
			org.json.JSONObject identifyRumor = text.aa("http://2019ncov.bioon.com/rumors.json");//谣言
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(-1);
			session.setAttribute("countryjson", string);
			session.setAttribute("spreadQuery", string2);
			session.setAttribute("tripQuery", tripQuery);
			session.setAttribute("identifyRumor", identifyRumor);
			request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
