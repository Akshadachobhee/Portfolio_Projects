import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.*;
 
@WebServlet("/AddPhotoServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class AddPhotoServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();	
		try{
	        	String appPath = request.getServletContext().getRealPath("/");

			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");
		
			String uid = request.getParameter("uid");
			String photo="";
		
		        for(Part part : request.getParts()) {
		        	String fileName = extractFileName(part);

		    		if(!fileName.equals(""))
		    		{
					photo= fileName;
                    			part.write(appPath + "/images/" + photo);
				}
		    	}

			PreparedStatement ps = con.prepareStatement("insert into photos(photo_path,email) values(?,?)");
			
			ps.setString(1,photo);
			ps.setString(2,uid);

			ps.executeUpdate();
			
			response.sendRedirect("http://localhost:8080/smartcity/upload_photo.jsp");
	        }
		catch(Exception e){
			out.println("<h4>"+e+"</h4>");
		}	
	}

	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
	        String[] items = contentDisp.split(";");
	        for (String s : items) {
	            if (s.trim().startsWith("filename")) {
	                return s.substring(s.indexOf("=") + 2, s.length()-1);
	            }
	        }
		return "";
	}
}
