package mvc;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Map;
import java.util.Properties;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;


//@WebServlet("/Control")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 명령어와 명령어처리 클래스를 쌍으로 저장
	
	private Map<String, Object> commandMap =
			new HashedMap<String, Object>();
	/*
	 *  명령어와 처리 클래스가 매핑되어있는 properties 파일을 읽어서
	 *  Map 객체인 commandMap에 저장
	 *  
	 *  명령어와 처리클래스가 매핑되어있는 파일명은 Command.proprerties
	 *  
	 * */
	public void init(ServletConfig config) throws ServletException {
		
		//web.xml 에서 propertyConfig 에 해당하는 init-param의 값을 읽어옴
			String props =config.getInitParameter("propertyConfig");
			//명령어와 처리클래스의 매핑정보 저장할 Properties 객체를 생성
			Properties pr=new Properties();
			String path=config.getServletContext().getRealPath("/WEB-INF");
		
			FileInputStream  f =null;
			try {
				//Command.properties 파일을 내용을 읽어와서 
				f= new FileInputStream(new File(path,props));
				//Command.properties 파일의 정보를 Properties 객체에 저장함
				pr.load(f);
			} catch (IOException e) {
				throw new ServletException(e);
			}finally {
				if (f != null)try {f.close();}catch (IOException ex) {}
			}
			
		
			Iterator<Object> keyiter = pr.keySet().iterator();
			
			while(keyiter.hasNext()) {
				String command= (String)keyiter.next();
				String className= pr.getProperty(command);
				
				try {//해당 문자를 클래스로 만듬
					Class commandClass =Class.forName(className);
					Object commandInstance= commandClass.newInstance();
					// Map에 저장함
					commandMap.put(command, commandInstance);
					
				}catch(ClassNotFoundException ce) {
					throw new ServletException(ce);
				}catch(InstantiationException ie) {
					throw new ServletException(ie);
				}catch(IllegalAccessException iie) {
					throw new ServletException(iie);
				}
			}
			
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		requestPro(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		requestPro(request, response);
	}
	// 사용자 요청를 분석해서 작업을 마침
	private void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
			String view = null;
			CommandProcess com =null;
		
			try {
				String command= request.getRequestURI();
				if (command.indexOf(request.getContextPath())==0) {
					command =command.substring(request.getContextPath().length());
				}
				com  =(CommandProcess)commandMap.get(command);
				view=com.requestPro(request, response);
			}catch(Throwable e) {
				throw new ServletException(e);
			}
		
			RequestDispatcher dispatcher=
					request.getRequestDispatcher(view);
			dispatcher.forward(request, response);
		
	}

}
