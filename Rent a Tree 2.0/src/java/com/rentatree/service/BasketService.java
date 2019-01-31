/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rentatree.service;

import com.rentatree.model.Product;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author cuba
 */

@WebServlet("/AddToBasket")
public class BasketService extends HttpServlet {
    
    //Take product from attribute and store it into the basket session attribute
    //Redirect to the basket with a flag for basket item added so that a message
    //can be displayed to confirm success of bascket addition
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        ArrayList<Product> curBasket = (ArrayList) session.getAttribute("basket");
        curBasket.add((Product)request.getAttribute("newItem"));
        session.setAttribute("basket", curBasket);
        
        //redirect to basket.jsp
        RequestDispatcher rd = request.getRequestDispatcher("basket.jsp");
                    rd.forward(request, response);
        

    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // If called via POST... do what we'd do if called via GET.
        doGet(request, response);
    }
    
}
