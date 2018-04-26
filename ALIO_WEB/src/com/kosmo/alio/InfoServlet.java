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
 * Servlet implementation class InfoServlet
 */
@WebServlet("/info")
public class InfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//action
		String action = request.getParameter("action");
		//seq
		String gseq = request.getParameter("gseq");
		String itseq = request.getParameter("itseq");
		//Imp
		GameImp gi = new GameImp();
		InfoTypeImp iti = new InfoTypeImp();
		InfoImp i = new InfoImp();
		//VO
		GameVO gvo = gi.gameDetail(Integer.parseInt(gseq));
		//list
		ArrayList<InfoTypeVO> itlist = new ArrayList<InfoTypeVO>();
		
		if (action==null || action=="" || action.equals("list")){
			
			WrapperVO wvo = new WrapperVO();
			ArrayList<WrapperVO> list = new ArrayList<WrapperVO>();
			
			list = i.infoList(Integer.parseInt(itseq));
			
			for (int j = 0; j<list.size() ; j++) {
				wvo = list.get(j);
				System.out.print(wvo.getIvo().getIseq()+ "    ");
				System.out.print(wvo.getItvo().getItseq()+ "    ");
				System.out.print(wvo.getIvo().getItitle()+ "    ");
				System.out.print(wvo.getIvo().getIbody()+ "    ");
				System.out.print(wvo.getGvo().getGseq()+ "    ");
				System.out.println(wvo.getIvo().getIregdate());
			}
			
			itlist = iti.infoTypeView(Integer.parseInt(gseq));
			
			
			request.setAttribute("LVL_WVO_LIST", list);
			request.setAttribute("LVL_ITVO_LIST", itlist);
			request.setAttribute("LVL_GVO", gvo);
			request.setAttribute("LVL_ITSEQ", itseq);
			
			RequestDispatcher rd = request.getRequestDispatcher("/alio/fuse/alio_info_card.jsp");
			rd.forward(request, response);
			
			
			
		} else if (action.equals("view")){
			
			String iseq = request.getParameter("iseq");
			WrapperVO wvo = new WrapperVO();
			InfoVO ivo = new InfoVO();
			ArrayList<WrapperVO> list = new ArrayList<WrapperVO>();
			
			ivo = i.infoView(Integer.parseInt(iseq));
			
			System.out.println(ivo.getItitle());
			System.out.println(ivo.getIbody());
			System.out.println(ivo.getIseq());
			
			itlist = iti.infoTypeView(Integer.parseInt(gseq));
			
			request.setAttribute("LVL_IVO", ivo);
			request.setAttribute("LVL_GVO", gvo);
			request.setAttribute("LVL_ITVO_LIST", itlist);
			request.setAttribute("LVL_ITSEQ", itseq);
			
			RequestDispatcher rd = request.getRequestDispatcher("/alio/fuse/alio_info_view.jsp");
			rd.forward(request, response);
			
		} else if (action.equals("input")){
			
			request.setAttribute("LVL_GVO", gvo);
			request.setAttribute("LVL_ITSEQ", itseq);
			
			RequestDispatcher rd = request.getRequestDispatcher("/alio/fuse/alio_info_input.jsp");
			rd.forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		
		String action = request.getParameter("action");
		String gseq = request.getParameter("gseq");
		String itseq = request.getParameter("itseq");
		
		System.out.println(action);
		
		GameImp gi = new GameImp();
		InfoImp i = new InfoImp();
		
		InfoVO ivo = new InfoVO();

		if(action.equals("insert")){
			
			String ititle = request.getParameter("ititle");
			String ibody = request.getParameter("ibody");
			
			System.out.println(gseq);
			System.out.println(itseq);
			System.out.println(ititle);
			System.out.println(ibody);
			
			//VO선언
			WrapperVO wvo = new WrapperVO();
			GameVO gvo = new GameVO();
			InfoTypeVO itvo = new InfoTypeVO();
			//Imp선언
			
			itvo.setItseq(Integer.parseInt(itseq));
			gvo.setGseq(Integer.parseInt(gseq));
			ivo.setItitle(ititle);
			ivo.setIbody(ibody);
			
			wvo.setItvo(itvo);
			wvo.setGvo(gvo);
			wvo.setIvo(ivo);
			
			System.out.println(wvo.itvo.getItseq());
			
			int res = i.infoInsert(wvo);
			
			response.sendRedirect("/info?action=list&itseq="+itseq+"&gseq="+gseq);
			
			System.out.println(res);
			
		} else if(action.equals("edit")) {
			
			GameVO gvo = gi.gameDetail(Integer.parseInt(gseq));
			
			String iseq = request.getParameter("iseq");
			
			ivo = i.infoView(Integer.parseInt(iseq));
			
			
			request.setAttribute("LVL_GVO", gvo);
			request.setAttribute("LVL_IVO", ivo);
			request.setAttribute("LVL_ITSEQ", itseq);
			
			RequestDispatcher rd = request.getRequestDispatcher("/alio/fuse/alio_info_input.jsp");
			rd.forward(request, response);
			
		} else if(action.equals("delete")){
			
			String iseq = request.getParameter("iseq");
			
			int res = 0;
			
			res = i.infoDelete(Integer.parseInt(iseq));
			
			if(res>0){
				response.sendRedirect("/info?action=list&gseq="+gseq+"&itseq="+itseq);
			}
			
		} else if(action.equals("update")){
			
			String ititle = request.getParameter("ititle");
			String ibody = request.getParameter("ibody");
			String iseq = request.getParameter("iseq");
			
			//VO선언
			ivo.setItitle(ititle);
			ivo.setIbody(ibody);
			ivo.setIseq(Integer.parseInt(iseq));
			
			int res = i.infoUpdate(ivo);
			
			System.out.println(res);
			
			if(res>0){
				response.sendRedirect("/info?action=list&gseq="+gseq+"&itseq="+itseq);
			}
		}

	}
}


