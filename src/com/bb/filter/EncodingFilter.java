package com.bb.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Map;
//在filter下新建一个EncodingFilter用来解决中文字符集乱码，它需要实现Filter接口，并重写doFilter函数
@WebFilter(filterName = "EncodingFilter")

//由Web容器来调用来释放资源
public class EncodingFilter implements Filter {
    public void destroy() {//过滤器销毁
    }


//过滤器就是在源数据和目的数据之间起过滤作用的中间件。
//   Web应用中，在处理请求时，经常有一些公共的工作，比如设置字符集。
//   这样的工作需要写在每个页面，这样的写法费力且不好修改。使用过滤器就像在这些流程前加了一道拦，
//   将需要进行的操作放到拦里执行，而所有经过这道拦的流程都会“被”执行该操作。

    //这是一个完成过滤行为的方法。这同样是上游过滤器调用的方法。
    // 引入的FilterChain对象提供了后续过滤器所要调用的信息。
    // 如果该过滤器是过滤器链中的最后一个过滤器，则将请求交给被请求资源。也可以直接给客户端返回响应信息。
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest httpServletRequest = (HttpServletRequest) request;
        HttpServletRequest myRequest = new com.bb.filter.MyRequest(httpServletRequest);
        response.setContentType("text/html;charset=utf-8");//将编码改为utf-8
        chain.doFilter(myRequest, response);
    }


    //由Web容器来调用完成过滤器的初始化工作。它保证了在第一次doFilter()调用前由容器调用。
    public void init(FilterConfig config) throws ServletException {
    }//过滤器初始化
}

class MyRequest extends HttpServletRequestWrapper {
    private HttpServletRequest request;
    private boolean hasEncode;

    public MyRequest(HttpServletRequest request) {
        super(request);
        this.request = request;
    }
//HttpServletRequest对象代表客户端的请求，当客户端通过HTTP协议访问服务器时，HTTP请求头中的所有信息都封装在这个对象中
// ，通过这个对象提供的方法，可以获得客户端请求的所有信息。
    @Override
    public Map<String, String[]> getParameterMap() {
        String method = request.getMethod();
        if (method.equalsIgnoreCase("post")) {
            try {
                request.setCharacterEncoding("utf-8");
                return request.getParameterMap();
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        } else if (method.equalsIgnoreCase("get")) {
            Map<String, String[]> parameterMap = request.getParameterMap();
                if (!hasEncode) {
                    for (String parameterName : parameterMap.keySet()) {
                        String[] values = parameterMap.get(parameterName);
                        if (values != null) {
                            for (int i = 0; i < values.length; i++) {
                                values[i] = new String(values[i].getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);
                            }
                        }
                    }
                    hasEncode = true;
                }
                return parameterMap;
        }
        return super.getParameterMap();
    }

    @Override
    public String getParameter(String name) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        String[] values = parameterMap.get(name);
        if (values == null) {
            return null;
        }
        return values[0];
    }

    @Override
    public String[] getParameterValues(String name) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        String[] values = parameterMap.get(name);
        return values;
    }
}
