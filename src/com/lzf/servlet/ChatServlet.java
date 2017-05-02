package com.lzf.servlet;

import com.lzf.test.AesTest;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by Administrator on 2017/4/25.
 */
public class ChatServlet extends javax.servlet.http.HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String param = request.getParameter("content");
        System.out.println(param+"pppp");
        if(param != null && !"".equals(param)) {
            String result = AesTest.testAes(param);
            System.out.println(result+",,,,,");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(result);
        }
    }

    protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}
