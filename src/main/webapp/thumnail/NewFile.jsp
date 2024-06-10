<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%@ page import="java.awt.Graphics2D"%>// 이미지 처리를 위해 JAI클래스 및 그래픽 관련
클래스들을 import.

<%@ page import="java.awt.image.renderable.ParameterBlock"%>
<%@ page import="java.awt.image.BufferedImage"%>
<%@ page import="javax.media.jai.JAI"%>
<%@ page import="javax.media.jai.RenderedOp"%>
<%@ page import="javax.imageio.ImageIO"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>//


<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
<%
String imagePath = request.getRealPath("image");// 실제로 업로드될 폴더의 경로.

int size = 1 * 1024 * 1024;// 이미지 업로드 크기를 10기가로 제한.

String filename = "";

try {

	MultipartRequest multi = new MultipartRequest(request,imagePath,size,"euc-kr",new DefaultFileRenamePolicy());// 썸네일 이미지로 변환할 이미지를 업로드한다.

	Enumeration files = multi.getFileNames();

	String file = (String) files.nextElement();

	filename = multi.getFilesystemName(file);

} catch (Exception e) {// 용량제한을 넘기는 등 Exception이 발생할 경우 Exception 내용을 출력한다.

	e.printStackTrace();

}

ParameterBlock pb = new ParameterBlock(); 

pb.add(imagePath + "/" + filename);

RenderedOp rOp = JAI.create("fileload", pb);
BufferedImage bi = rOp.getAsBufferedImage();
BufferedImage thumb = new BufferedImage(100, 100, BufferedImage.TYPE_INT_RGB);
Graphics2D g = thumb.createGraphics();

File file = new File(imagePath + "/sm_" + filename);

ImageIO.write(thumb, "jpg", file);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	-원본 이미지-
	<br>

	<img src="image/<%=filename%>">
	<p>

		-썸네일 이미지-<br> <img src="image/sm_<%=filename%>">
</body>
</html>