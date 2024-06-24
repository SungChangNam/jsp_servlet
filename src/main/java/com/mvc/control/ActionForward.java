package com.mvc.control;


/* 
 * ActionForward
 * 	- XXXAction의 비즈니스 로직 수행 후 
 * 	ControlServlet 에게 반환하는  객체
 *  	(이동할 url과 이동방법을 저장함)
 * 
 * */


public class ActionForward {
		private String url;
		private boolean redirect;
		
		public ActionForward() {}
		public ActionForward(String url) {
			this.url=url;}
		public ActionForward(String url, boolean redriect) {
			this.url=url;
			this.redirect=redriect;
		}
		public String getUrl() {
			return url;
		}
		public void setUrl(String url) {
			this.url = url;
		}
		public boolean isRedirect() {
			return redirect;
		}
		public void setRedirect(boolean redirect) {
			this.redirect = redirect;
		}
		
		
}
