package com.st.ssm.init;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

public class UserFilter implements Filter {

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
    	HttpServletRequest hsRequest = (HttpServletRequest) request;
    	Object user = hsRequest.getSession().getAttribute("user");
    	if(user == null) {//盗链
    		request.getRequestDispatcher("/web/login.jsp").forward(request, response);
    	}else {
    		chain.doFilter(request, response);// 当前过滤器放行
    	}
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
    }

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

}
