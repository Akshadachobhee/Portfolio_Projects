import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import java.sql.*;
import java.text.*;
 
@WebServlet("/UpdateCategoryServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*2, // 2MB
                 maxFileSize=1024*1024*10,      // 10MB
                 maxRequestSize=1024*1024*50)   // 50MB
public class UpdateCategoryServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();	
		try{
	        	String appPath = request.getServletContext().getRealPath("/");

	Class.forName("com.mysql.jdbc.Driver");

	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/smartcity","root","");
			String cid = request.getParameter("cid");		
			String cdesc = request.getParameter("cdesc");

			Statement s = con.createStatement();
			s.executeUpdate("update category set cat_desc='"+cdesc+"' where cat_id="+cid);

			String photo="";
		
		        for(Part part : request.getParts()) {
		        	String fileName = extractFileName(part);

		    		if(!fileName.equals(""))
		    		{
					s = con.createStatement();
					ResultSet rs = s.executeQuery("select cat_path from category where cat_id="+cid);
					rs.next();
					File f = new File(appPath+"/images/"+rs.getString(1));
					f.delete();

					photo= fileName;
                    			part.write(appPath + "/images/" + photo);
					s = con.createStatement();
					s.executeUpdate("update category set cat_path='"+photo+"' where cat_id="+cid);
				}
		    	}

			response.sendRedirect("http://localhost:8080/smartcity/add_category.jsp");
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
