package com.kosmo.alio;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/crewservlet")
public class Crewservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;




	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if(action == null) {

			response.sendRedirect("/category");

		} else if(action.equals("list") || action.equals("list")){
			CrewImp ci = new CrewImp();
			CrewVO cvo = new CrewVO();

			ArrayList<CrewVO> list = new ArrayList<CrewVO>();
			list = ci.crewList();

			request.setAttribute("LVL_CLIST", list);

			RequestDispatcher rd = request.getRequestDispatcher("/alio/fuse/alio_crew_list.jsp");
			rd.forward(request, response);

		} else if(action.equals("detail")) {
			//member_detail.jsp
			CrewVO cvo = new CrewVO();
			CrewImp ci = new CrewImp();

			String cseq = request.getParameter("cseq");

			System.out.println(cseq);

			cvo = ci.crewDetail(Integer.parseInt(cseq));

			//			response.sendRedirect("/test/member_detail.jsp");

			request.setAttribute("LVL_CVO", cvo);
			RequestDispatcher rd = request.getRequestDispatcher("/alio/fuse/alio_profile.jsp");
			rd.forward(request, response);

		} else if(action.equals("edit")) {
			//member_detail.jsp
			CrewVO cvo = new CrewVO();
			CrewImp ci = new CrewImp();

			String cseq = request.getParameter("cseq");

			System.out.println(cseq);

			cvo = ci.crewDetail(Integer.parseInt(cseq));

			//			response.sendRedirect("/test/member_detail.jsp");

			request.setAttribute("LVL_CVO", cvo);
			RequestDispatcher rd = request.getRequestDispatcher("/alio/fuse/alio_crew_view.jsp");
			rd.forward(request, response);

		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); //한글화 처리

		PrintWriter out = response.getWriter();

		CrewVO cvo = new CrewVO();
		CrewImp ci = new CrewImp();

		String action = request.getParameter("action");


		if(action.equals("insert")) {

			System.out.println("들오아");

			String cid = request.getParameter("cid");
			String cpw = request.getParameter("cpw");
			String cname = request.getParameter("cname");
			String cphone = request.getParameter("cphone");

			System.out.println(cid);
			System.out.println(cpw);

			cvo.setCid(cid);
			cvo.setCpw(cpw);
			cvo.setCname(cname);
			cvo.setCphone(cphone);

			int res = ci.crewInsert(cvo);
			System.out.println(res + "건 입력");

			response.sendRedirect("/category");

		} else if(action.equals("userupdate")) {

			String cseq = request.getParameter("cseq");
			String cpw = request.getParameter("cpw");
			String cphone = request.getParameter("cphone");
			String ctype = request.getParameter("ctype");


			cvo.setCseq(Integer.parseInt(cseq));
			cvo.setCpw(cpw);
			cvo.setCphone(cphone);
			cvo.setCtype(ctype);

			ci.crewUpdate(cvo); 

			response.sendRedirect("/category");

		} else if(action.equals("adminupdate")) {

			String ctype = request.getParameter("ctype");
			String cseq = request.getParameter("cseq");

			cvo.setCtype(ctype);
			cvo.setCseq(Integer.parseInt(cseq));

			ci.crewTypeUpdate(cvo);

			response.sendRedirect("/crewservlet?action=list");

		} else if(action.equals("leave")) {
			String cseq = request.getParameter("cseq");
			ci.crewDelete(Integer.parseInt(cseq));
			response.sendRedirect("/login");
			
			
			
		} else if(action.equals("leaveForAjax")) {
			String cseq = request.getParameter("cseq");
			String cpw = request.getParameter("cpw");
			System.out.println("cseq:" + cseq + ",cpw:" + cpw);
			
			int res = 0;
			res = ci.crewDeleteForAjax(Integer.parseInt(cseq), cpw);
			System.out.println("Ress-------------------" + res);
			
			response.getWriter().println(res);
			
		} else if(action.equals("delete")) {

				String cseq = request.getParameter("cseq");

				ci.crewDelete(Integer.parseInt(cseq));
				response.sendRedirect("/crewservlet?action=list");

		}
	}
}
