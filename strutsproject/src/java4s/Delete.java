package java4s;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.interceptor.ServletRequestAware;
import com.opensymphony.xwork2.ActionSupport;

public class Delete extends ActionSupport implements ServletRequestAware {
	private static final long serialVersionUID = 1L;

	HttpServletRequest request;

	public String execute() {

		try {

			Connection con = getConnection();
			PreparedStatement ps = null;

			String cv[] = request.getParameterValues("rdel");

			for (int i = 0; i < cv.length; i++) {
				ps = con.prepareStatement("delete from details where SNO=(?)");
				int k = Integer.parseInt(cv[i]);
				System.out.println("this is" + k);
				ps.setInt(1, k);
				ps.executeUpdate();
				con.commit();
			}

			ps.close();
			con.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

		return SUCCESS;

	}

	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

	public HttpServletRequest getServletRequest() {
		return request;
	}

	private static Connection getConnection() {
		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookstore", "root", "root");
		} catch (Exception e) {
			System.out.println(e);
		}
		return con;
	}
}
