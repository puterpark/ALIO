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

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;


@WebServlet("/ga")
public class GameAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public GameAdminServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("charset=UTF-8");
		String action = request.getParameter("action");
		
		if((action == null) || action.equals("")) {
			
			GameVO gvo = new GameVO();
			GameImp gi = new GameImp();
			
			ArrayList<GameVO> gtlist = new ArrayList<GameVO>();
			
			gtlist = gi.gameList();
			
			/*
			 * 서브리스트 출력하는 곳
			 */
			
			InfoTypeVO itvo = new InfoTypeVO();
			InfoTypeImp iti = new InfoTypeImp();
			ArrayList<InfoTypeVO> ilist = new ArrayList<InfoTypeVO>();
			
			BodTypeVO btvo = new BodTypeVO();
			BodTypeImp bti = new BodTypeImp();
			ArrayList<BodTypeVO> btlist = new ArrayList<BodTypeVO>();
			
			ilist = iti.infoTypeListAll();
			btlist = bti.bodTypeViewAll();
			
			request.setAttribute("LVL_GTLIST", gtlist);
			request.setAttribute("LVL_ILIST", ilist);
			request.setAttribute("LVL_BTLIST", btlist);
			
			RequestDispatcher rd = request.getRequestDispatcher("/alio/fuse/alio_game_admin.jsp");
			rd.forward(request, response);
			
		} else if(action.equals("bodTypeInsert")) {
			BodTypeImp bti = new BodTypeImp();
			String gseq = request.getParameter("gseq");
			bti.bodTypeInsert1(Integer.parseInt(gseq));
			bti.bodTypeInsert2(Integer.parseInt(gseq));
			bti.bodTypeInsert3(Integer.parseInt(gseq));
			bti.bodTypeInsert4(Integer.parseInt(gseq));
			bti.bodTypeInsert5(Integer.parseInt(gseq));
			bti.bodTypeInsert6(Integer.parseInt(gseq));
			System.out.println("오나료");
			
			response.sendRedirect("/ga");
		}
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getParameter("action");
		Gson gson = new Gson();

		if(action.equals("insert")) {
			
			
			String gtitle = request.getParameter("gtitle");
			GameImp gi = new GameImp();
			GameVO gvo = new GameVO();
			
			gvo.setGtitle(gtitle);
			gi.gameInsert(gvo);
			
			ArrayList<GameVO> glist = new ArrayList<GameVO>();
			
			glist = gi.gameList();
			
			//System.out.println(rlist.size() + "------------");
			//toJson : 자바객체->json(String문장)
			String res = gson.toJson(glist);
			PrintWriter out = response.getWriter();
			out.println(res);
				
		}
		else if(action.equals("gameinsert")) {
			
			String jsonStr = request.getParameter("CVAL");

			JsonParser jsonParser = new JsonParser();
			JsonElement element = jsonParser.parse(jsonStr);
			
			String gseq = element.getAsJsonObject().get("gseq").getAsString();
			String itname = element.getAsJsonObject().get("itname").getAsString();
			System.out.println("gseq:=------" + gseq);
			System.out.println("itname: ---"+ itname);
			System.out.println(gseq);
			
			InfoTypeVO itvo = new InfoTypeVO();
			WrapperVO wvo = new WrapperVO();
			InfoTypeImp iti = new InfoTypeImp();
			
			itvo.setItname(itname);
			itvo.setGseq(Integer.parseInt(gseq));
			wvo.setItvo(itvo);
			iti.infoTypeInsert(wvo);
			
			ArrayList<InfoTypeVO> itlist = new ArrayList<InfoTypeVO>();
			
			itlist = iti.infoTypeList(Integer.parseInt(gseq));
	
			String res = gson.toJson(itlist);
			PrintWriter out = response.getWriter();
			out.println(res);
			
		} else if(action.equals("gameeditForAjax")) {
			
			GameVO gvo = new GameVO();
			GameImp gi = new GameImp();
//			Gson gson = new Gson();
			//--------------------------
			//2.JSON 검색조건 추출
			//--------------------------
			String jsonStr = request.getParameter("MYKEY");
			System.out.println(jsonStr);	//{"rseq":"0","rbody":"값0"}
	
	//		//fromJson : json(String문장)->자바객체
			gvo = gson.fromJson(jsonStr, GameVO.class);
			System.out.println("impl.update("+gvo.getGseq()+","+gvo.getGtitle()); //ReplyImp 메서드 사용할 것
	
		//-----------------------------------------
		// 1건 수정
		//-----------------------------------------
//			int res = impl.update(vo);
			int res = gi.gameUpdate(gvo);
			
			PrintWriter  out = response.getWriter();
			out.println(res);
			
		} else if(action.equals("infotypeeditForAjax")) {
			
			InfoTypeVO itvo = new InfoTypeVO();
			InfoTypeImp iti = new InfoTypeImp();
//			Gson gson = new Gson();
			//--------------------------
			//2.JSON 검색조건 추출
			//--------------------------
			String jsonStr = request.getParameter("MYKEY");
			System.out.println(jsonStr);	//{"rseq":"0","rbody":"값0"}
	
	//		//fromJson : json(String문장)->자바객체
			itvo = gson.fromJson(jsonStr, InfoTypeVO.class);
			System.out.println("impl.update("+itvo.getItseq()+","+itvo.getItname()); //ReplyImp 메서드 사용할 것
	
		//-----------------------------------------
		// 1건 수정
		//-----------------------------------------
//			int res = impl.update(vo);
			int res = iti.infoTypeUpdate(itvo);
			
			PrintWriter  out = response.getWriter();
			out.println(res);
		} /*else if(action.equals("bodTypeInsert")) {
			BodTypeImp bti = new BodTypeImp();
			String gseq = request.getParameter("gseq");
			bti.bodTypeInsert1(Integer.parseInt(gseq));
			bti.bodTypeInsert2(Integer.parseInt(gseq));
			bti.bodTypeInsert3(Integer.parseInt(gseq));
			bti.bodTypeInsert4(Integer.parseInt(gseq));
			bti.bodTypeInsert5(Integer.parseInt(gseq));
			bti.bodTypeInsert6(Integer.parseInt(gseq));
			
			response.sendRedirect("/ga");
		}*/
	}

}
