package filter;

import java.io.IOException;
import java.util.logging.Logger;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class urlFilter implements Filter{
	

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		System.out.println("��ʼ��������");
	}
	@Override
	public void doFilter(ServletRequest ServletRequest, ServletResponse ServletResponse, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request =  (HttpServletRequest) ServletRequest;
		HttpServletResponse response  = (HttpServletResponse) ServletResponse;
		
		String servletPath = request.getServletPath();
		int urlIndex = servletPath.lastIndexOf("/");
		String url = servletPath.substring(urlIndex);
		System.out.println("url:"+url);
		
		
		if(servletPath==null || !servletPath.toLowerCase().endsWith(".jsp")){
//			��jsp��β��ֱ������
			chain.doFilter(request, response);
		}
		//ƴװurl
		if(servletPath.toLowerCase().contains("front")){
//			servletPath = url;

//			chain.doFilter(request, response);
//			response.sendRedirect(request.getContextPath());
			
		}
		System.out.println(servletPath);
		System.out.println("������·����"+request.getContextPath());
		/*chain.doFilter(request, response);*/
		String targetUrl = "/front"+url;
		/*request.getRequestDispatcher(targetUrl).forward(request, response);*/
		System.out.println(request.getServletContext().getRealPath(targetUrl));
		request.getRequestDispatcher(servletPath).forward(request, response);
		
	}
}
