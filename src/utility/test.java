package utility;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Random;

import com.sjl.joinme.user.UserDAO;


public class test{

        public static void main(String[] args)
    	{
        	UserDAO dao = new UserDAO();
        	System.out.println(dao.moblieNumberExist("8109049748"));
        }
        
       
}