package com;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.hospital;
import model.hospitalDeo;

/**
 * Servlet implementation class hostpitalAPI
 */
@WebServlet("/hostpitalAPI")
public class hostpitalAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;
	hospital hostpitalmod  = new hospital();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hostpitalAPI() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		hospitalDeo hospitalDeo = new hospitalDeo();
		hospitalDeo.setHospitalName(request.getParameter("hospitalName"));
		hospitalDeo.setHospitalAddress(request.getParameter("hospitalAddress"));
		hospitalDeo.setHospitalEmail(request.getParameter("hospitalEmail"));
		hospitalDeo.setPhone(request.getParameter("phone"));
		hospitalDeo.setPassword(request.getParameter("password"));
		
		String	output = hostpitalmod.addnewhospital(hospitalDeo);
		response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doPut(HttpServletRequest, HttpServletResponse)
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		hospitalDeo hospitalDeo = new hospitalDeo();
		System.out.println(request);
		
		//System.out.println(decodedStr);
		Map paras = getParasMap(request);	
		System.out.println(paras);
		String hospitalName = URLDecoder.decode(paras.get("hospitalName").toString(), "UTF-8");
		String hospitalAddress = URLDecoder.decode(paras.get("hospitalAddress").toString(), "UTF-8");
		hospitalDeo.setHospitalName(hospitalName);
		hospitalDeo.setHospitalAddress(hospitalAddress);
		hospitalDeo.setPhone(paras.get("phone").toString());
		
		
		String decodedEmail = URLDecoder.decode(paras.get("hospitalEmail").toString(), "UTF-8");
		hospitalDeo.setHospitalEmail(decodedEmail);
		
		
		hospitalDeo.setPassword(paras.get("password").toString());
		hospitalDeo.setHospitalId(Integer.parseInt(paras.get("HospitalId").toString()));
		String	 output = hostpitalmod.updateHospitalDetails(hospitalDeo);
		response.getWriter().write(output);
	}

	/**
	 * @see HttpServlet#doDelete(HttpServletRequest, HttpServletResponse)
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map paras = getParasMap(request);
		System.out.println(paras);
		hospitalDeo hospitalDeo = new hospitalDeo();
		hospitalDeo.setHospitalId(Integer.parseInt(paras.get("HospitalId").toString()));
		String	 output = hostpitalmod.deletehospital(hospitalDeo);
		response.getWriter().write(output);
	}
	
private static Map getParasMap(HttpServletRequest request) { 
		
		Map<String, String> map = new HashMap<String, String>(); 
		
		try  {   
			Scanner scanner = new Scanner(request.getInputStream(), "UTF-8");   
			String queryString = scanner.hasNext() ?          
			scanner.useDelimiter("\\A").next() : "";  
			scanner.close(); 
			
			String[] params = queryString.split("&"); 
			
			for (String param : params) {
				String[] p = param.split("=");    
				map.put(p[0], p[1]); 
				
			}
		}
		catch (Exception e) {
			
			
		}
		
		return map; 
	}

}
