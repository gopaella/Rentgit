/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.rentatree.util;

import com.rentatree.model.Product;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Alan
 */
public class ProductHandler {
    static DBConnector dbc = new DBConnector("SYS AS SYSDBA", "Huskyanna234", "jdbc:oracle:thin:@localhost:1521:orcl");
    
    public static ArrayList<Product> getProducts() throws SQLException{
        String sql = "SELECT * FROM Product";
        
        System.out.println(sql);
        dbc.registerDriver();
        DBConnector.connect();
        ResultSet rs = DBConnector.executeSQL(sql);
       
        
        
        return resultSetToProducts(rs);
        
    }
	
    public static ArrayList<Product> getProductsSortBy(int minSize, int maxSize
                                                        ) throws SQLException {
        
        //TO-DO: A whole nasty set of juuuuuuicy if-statements... YAY
        
        String sql = "SELECT * FROM Product WHERE ProductHeight > " + minSize + " AND ProductHeight < " + maxSize;
        
        System.out.println(sql);
        dbc.registerDriver();
        dbc.connect();
        ResultSet rs = dbc.executeSQL(sql);

        return resultSetToProducts(rs);
    }
    public static ArrayList<Product> resultSetToProducts(ResultSet rs){
        ArrayList<Product> products = new ArrayList<>();
        try{
            while(rs.next()){
            Product newProduct = new Product(rs.getInt("ProductID"), rs.getString("ProductName"), rs.getString("ProductType"), rs.getString("ProductHeight"), rs.getFloat("PricePerDay"));
            products.add(newProduct);
            
            }
            return products;
        }catch(SQLException ex){
            ex.printStackTrace();
        }
        return null;
    }
}
