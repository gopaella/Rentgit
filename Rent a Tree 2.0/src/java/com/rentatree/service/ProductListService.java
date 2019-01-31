/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rentatree.service;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.rentatree.util.ProductHandler;
import com.rentatree.model.Product;
import javax.servlet.http.HttpServlet;
import javax.ws.rs.core.Response;

/**
 *
 * @author cuba
 */

@WebServlet("/Products")
public class ProductListService extends HttpServlet {
    
    public ProductListService() {
    
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Generate list of products; hand over to a JSP page to display them.
		// We can get any parameters we need from the request (we don't need/use any at the moment).
                
                //A bunch of strings
                String minSize = request.getParameter("minSize");
                
		ArrayList<Product> products = new ArrayList<Product>();
		try {
			products = ProductHandler.getProducts();
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
