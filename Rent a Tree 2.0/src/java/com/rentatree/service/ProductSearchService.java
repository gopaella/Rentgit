/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rentatree.service;

import com.rentatree.model.Product;
import com.rentatree.util.ProductHandler;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author cuba
 */

@WebServlet("/ProductSearchResult")
public class ProductSearchService extends HttpServlet {
    
    public ProductSearchService() {
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Generate list of products; hand over to a JSP page to display them.
		// We can get any parameters we need from the request (we don't need/use any at the moment).
                
                int minSize = 0;
                int maxSize = 999;
                ArrayList<String> materials = new ArrayList<>();
                ArrayList<String> suppliers = new ArrayList<>();
                
                Map<String, String[]> checkParams = request.getParameterMap();
                
                //A bunch of strings
                if(!request.getParameter("minSize").equals("")){
                    minSize = Integer.parseInt(request.getParameter("minSize"));
                }
                
                if(!request.getParameter("maxSize").equals("")){
                    maxSize = Integer.parseInt(request.getParameter("maxSize"));
                }
                
                for(String param : checkParams.keySet()) {
                    if(checkParams.get(param).equals("on")) {
                        suppliers.add(param);
                    }
                }
                
                System.out.println(suppliers.toString());
                
		ArrayList<Product> products = new ArrayList<>();
		try {
			products = ProductHandler.getProductsSortBy(minSize, maxSize);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
                        System.out.println("Something Broke");
		}
		
		// Rather than embed lots of HTML into servlets; place the data you wan tto handle into the request
		request.setAttribute("products", products);
		// ... then forward the request to a JSP 'hidden' inside WEB_INF (so, can't be accessed directly by the user)
		RequestDispatcher rd = request.getRequestDispatcher("products.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// If called via POST... do what we'd do if called via GET.
		doGet(request, response);
	}
    
}
