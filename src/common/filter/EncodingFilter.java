package common.filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class EncodingFilter
 */
@WebFilter("/*")
public class EncodingFilter implements Filter {

    /**
     * Default constructor. 
     */
    public EncodingFilter() {

    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		System.out.println("EncodingFilter 소멸됨....");
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

		
		//전송방식이 post일때는 반드시 request 에 대해서 인코딩해야 함
		HttpServletRequest hrequest = (HttpServletRequest)request;
		if(hrequest.getMethod().equalsIgnoreCase("post")) {
			System.out.println("post 전송시에만 인코딩처리됨");
			request.setCharacterEncoding("utf-8");
		}
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
