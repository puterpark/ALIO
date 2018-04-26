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
 * Servlet implementation class InfoTypeList
 */
@WebServlet("/infotype")
public class InfoTypeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InfoTypeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//gseq 받음
		String gseq = request.getParameter("gseq");
		//-----------------------------------------------
		InfoTypeImp iti = new InfoTypeImp();
		InfoTypeVO itvo = new InfoTypeVO();
		GameImp gi = new GameImp();
		GameVO gvo = new GameVO();
		
		
		ArrayList<InfoTypeVO> list = new ArrayList<InfoTypeVO>();
		
		//gseq를 넣어서 list값 가져옴
		list = iti.infoTypeList(Integer.parseInt(gseq));
		//----------------------------------------
		
		for (int j = 0; j<list.size() ; j++) {
			itvo = list.get(j);
			System.out.print(itvo.getItseq()+ "    ");
			System.out.print(itvo.getItname()+ "    ");
		}
		
		gvo = gi.gameDetail(Integer.parseInt(gseq));
		
		request.setAttribute("LVL_ITVO_LIST", list);
		request.setAttribute("LVL_GVO", gvo);
		
		RequestDispatcher rd = request.getRequestDispatcher("/alio/fuse/alio_info_list.jsp");
		rd.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
