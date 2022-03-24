/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.speedstyle.prj301.utils;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author
 */
public class DBUtils {
    

    public static Connection getConnection() throws Exception {
        String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName=" + dbName;
        if (instance == null || instance.trim().isEmpty()) {
            url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
        }
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        return DriverManager.getConnection(url, userID, password);
    }
    private final static String serverName = "localhost";
    private final static String dbName = "ShoeDB";
    private final static String portNumber = "1433";
    private final static String instance = "";//LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
    private final static String userID = "avillX";
    private final static String password = "0711";
    public static void main(String[] args) {
        try{
            System.out.println(DBUtils.getConnection());
        } catch(Exception e){}
    }
}
