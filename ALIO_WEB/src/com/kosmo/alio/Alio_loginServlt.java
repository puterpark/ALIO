package com.kosmo.alio;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlt
 */
@WebServlet("/login11111111111111111")
public class Alio_loginServlt extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Alio_loginServlt() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*GameImp gi = new GameImp();
		BodTypeImp bti = new BodTypeImp();
		InfoTypeImp iti = new InfoTypeImp();

		ArrayList<GameVO> glist = gi.gameList();

		for(int g=0; g<glist.size(); g++)  {
			System.out.println( glist.get(g).getGtitle());
			ArrayList<BodTypeVO> btlist = bti.bodTypeList(glist.get(g).getGseq());
			glist.get(g).setBtlist(btlist);
		}

		request.setAttribute("LVL_GLIST", glist);

		RequestDispatcher rd = request.getRequestDispatcher("/alio/fuse/alio_login.jsp");
		//			Dispatcher : 메모리에 올리다, 붙인다.
		rd.forward(request, response);*/

		request.getSession().removeAttribute("LVL_SESS_CID");
		request.getSession().removeAttribute("LVL_SESS_CNAME");
		request.getSession().removeAttribute("LVL_SESS_CTYPE");
		request.getSession().removeAttribute("LVL_SESS_CSEQ");
		response.sendRedirect("/category");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		String cid = request.getParameter("cid");
		String cpw = request.getParameter("cpw");

		System.out.println(cid);
		System.out.println(cpw);
		System.out.println(action);

		CrewVO cvo = new CrewVO();
		CrewImp ci = new CrewImp();
		cvo.setCid(cid);
		cvo.setCpw(cpw);        // mid, mpw
		cvo = ci.login(cvo); //mid, mpw + mgubun, mna

		if(cvo.getCtype() == null || cvo.getCtype().equals("")) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print("alert('회원 정보를 확인해주세요.');");
			out.print("history.back();");
			out.print("</script>");
			out.close();
					
		} else {
			
			if(action.equals("") || action==null) {
				response.sendRedirect("/alio/fuse/alio_login.jsp");

			} else if(action.equals("login")) {

				if(cvo.getCtype() !=null && (cvo.getCtype().equals("a"))) {

					System.out.println(cvo.getCname());
					System.out.println(cvo.getCtype());

					// 회원 정보를  가져온 경우
					HttpSession session = request.getSession();
					// session 에는 사용자 정보만 담도록, 공지사항 및 게시판 보안이 필요한 정보들을 session 으로 저장
					session.setAttribute("LVL_SESS_CID", cvo.getCid());
					session.setAttribute("LVL_SESS_CNAME", cvo.getCname());
					session.setAttribute("LVL_SESS_CTYPE", cvo.getCtype());
					session.setAttribute("LVL_SESS_CSEQ", cvo.getCseq());


					response.sendRedirect("/category");

				} else if(cvo.getCtype() !=null && cvo.getCtype().equals("e")) {

					System.out.println(cvo.getCname());
					System.out.println(cvo.getCtype());
					

					// 회원 정보를  가져온 경우
					HttpSession session = request.getSession();
					// session 에는 사용자 정보만 담도록, 공지사항 및 게시판 보안이 필요한 정보들을 session 으로 저장
					session.setAttribute("LVL_SESS_CID", cvo.getCid());
					session.setAttribute("LVL_SESS_CNAME", cvo.getCname());
					session.setAttribute("LVL_SESS_CTYPE", cvo.getCtype());
					session.setAttribute("LVL_SESS_CSEQ", cvo.getCseq());

					response.sendRedirect("/category");

				} else if(cvo.getCtype() !=null && cvo.getCtype().equals("u")) {

					System.out.println(cvo.getCname());
					System.out.println(cvo.getCtype());

					// 회원 정보를  가져온 경우
					HttpSession session = request.getSession();
					// session 에는 사용자 정보만 담도록, 공지사항 및 게시판 보안이 필요한 정보들을 session 으로 저장
					session.setAttribute("LVL_SESS_CID", cvo.getCid());
					session.setAttribute("LVL_SESS_CNAME", cvo.getCname());
					session.setAttribute("LVL_SESS_CTYPE", cvo.getCtype());
					session.setAttribute("LVL_SESS_CSEQ", cvo.getCseq());

					response.sendRedirect("/category");
				} else {
					response.sendRedirect("/alio/fuse/alio_login.jsp");
				}

			}
		}


	}

}
