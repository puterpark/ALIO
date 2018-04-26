package com.kosmo.alio;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AlioServlet
 */
@WebServlet("/category2")
public class CategoryServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryServlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Get Call..request...");
		String ACTIONSTR = request.getParameter("ACTIONSTR");
		
		int currentPage = 1;
//		int totRecord = 2;
//		int blockCount = 2;
//		int blockPage = 2;

		if(ACTIONSTR == null || ACTIONSTR.equals("LIST")){

			if(request.getParameter("currentPage") !=null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			//bod_list.jsp
			GameImp gi = new GameImp();
			BodTypeImp bti = new BodTypeImp();
			InfoTypeImp iti = new InfoTypeImp();
//			int totalCount = gi.game
//			
//			PagingUtil pu = new PagingUtil("/AlioServlet?ACTIONSTR=LIST"
//					, currentPage 
//					, totalCount 
//					, 2  // 선택한 
//					, 2	);
//			String html = pu.getPagingHtml();
			
			ArrayList<GameVO> glist = gi.gameList();
			
			for(int g=0; g<glist.size(); g++)  {
				System.out.println( glist.get(g).getGtitle());
				ArrayList<BodTypeVO> btlist = bti.bodTypeList(glist.get(g).getGseq());
				glist.get(g).setBtlist(btlist);
			}
        
			
			
//			ArrayList<InfoTypeVO> itilist = iti.infoTypeList(1);
			

			//			MemberVO vo = new MemberVO();

			//			forward : list 객체를 보낼 수 있다. 
			//			1. 객체를 보낼 수 있다.
			//			2. request 의 제어권을 건내줄 수 있다.
			//			forward

			request.setAttribute("LVL_GLIST", glist);
//		
			
			
			
//			request.setAttribute("LVL_PAGING", html);
			//			request.setAttribute("LVL_VO", vo);


			RequestDispatcher rd = request.getRequestDispatcher("/alio/fuse/index_copy2.jsp");
			//			Dispatcher : 메모리에 올리다, 붙인다.
			rd.forward(request, response);
			//			response.sendRedirect("/test/member_list.jsp");

		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
