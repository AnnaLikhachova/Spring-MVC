package com.mvc.controller;

import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.Serializable;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import javax.imageio.ImageIO;
import org.springframework.web.multipart.MultipartFile;

import com.mvc.model.Product;
import com.mvc.model.User;


public class DBWorker implements Serializable{
	Connection conn;

	public DBWorker(Connection conn) {
		this.conn = conn;
	}

	public void enterData(String login, String password, String name, String gender, String area) {
		String query = "INSERT INTO user(login, password, name, gender, area) values (?,?,?,?,?)";

		PreparedStatement p = null;
		try {
			p = conn.prepareStatement(query);
			p.setString(1, login);
			p.setString(2, password);
			p.setString(3, name);
			p.setString(4, gender);
			p.setString(5, area);
			p.execute();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}

	public void insertImage(String img) {
		int len;
		String query=null;
		PreparedStatement pstmt=null;

		try {
			File file = new File(img);
			FileInputStream fis = new FileInputStream(file);
			len = (int) file.length();
			query = ("insert into christmasimage(name, length, data) VALUES(?,?,?)");
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, file.getName());
			pstmt.setInt(2, len);
			// Method used to insert a stream of bytes
			pstmt.setBinaryStream(3, fis, len);
			pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insertImage2(String img) {
		int len=0;
		String query=null;
		PreparedStatement pstmt=null;

		try {
			File file = new File(img);
			FileInputStream fis = new FileInputStream(file);
			len = (int) file.length();
			query = ("insert into christmasProducts(length, data) VALUES(?,?)");
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, len);
			// Method used to insert a stream of bytes
			pstmt.setBinaryStream(2, fis, len);
			pstmt.execute();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}	

	public User login(String login, String psw) {
		User user = null;
		String sql = "SELECT * FROM user WHERE login='" + login + "' AND password='" + psw + "'";
		Statement st = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e) {
		}
		ResultSet rs = null;
		try {
			rs = st.executeQuery(sql);
			if (rs.next()) {

				user = new User(rs.getString("login"), rs.getString("name"), rs.getString("password"),
						rs.getString("area"), rs.getString("gender"));
			}
		} catch (SQLException e) {
		}
		return user;
	}

	public byte[] getData() {

		byte[] fileBytes = null;
		String query;
		try {
			query = "SELECT * FROM christmasimage";
			Statement state = conn.createStatement();
			ResultSet rs = state.executeQuery(query);
			if (rs.next()) {
				fileBytes = rs.getBytes(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return fileBytes;
	}

	public BufferedImage getImage(byte[] fileBytes) {
		InputStream inputStream = new ByteArrayInputStream(fileBytes);
		BufferedImage image = null;
		try {
			image = ImageIO.read(inputStream);

		} catch (IOException e) {
			
			e.printStackTrace();
		}
		File outputFile = new File("/Users/anna/Desktop/image.png");
		try {
			ImageIO.write(image, "PNG", outputFile);
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		return image;
	}

	public File getImg(String id, String name) throws IOException {

		MultipartFile file = null;
		byte[] bytes = null;

		if (!file.isEmpty()) {
			bytes = file.getBytes();
			BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(name + "-uploaded")));
			stream.write(bytes);
			stream.close();
		}

		return null;

	}

	public File getImageData(String id, String name) {
		Statement state = null;
		ResultSet rs = null;
		FileOutputStream targetFile = null;
		InputStream input = null;
		byte[] fileBytes = null;
		MultipartFile file = null;
		File thefile = null;
		// List<String> bytes = new ArrayList();

		String query;
		try {
			query = "SELECT data FROM christmasimage WHERE id=" + id + "";
			state = conn.createStatement();
			rs = state.executeQuery(query);
			thefile = new File("HelloMVC/src/main/webapp/resources/'" + name + "'.jpg");
			targetFile = new FileOutputStream(thefile);
			System.out.println("Writing BLOB to file " + thefile.getAbsolutePath());
			if (rs.next()) {
				input = rs.getBinaryStream("data");
				fileBytes = rs.getBytes(1);
				// String encode =Base64.getEncoder().encodeToString(fileBytes);
				// bytes.add(encode);
				System.out.println(fileBytes);
				targetFile.write(fileBytes);
				targetFile.close();

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return thefile;
	}

	public List<String> finalImg() throws SQLException, IOException {
		
		List<String> bytes = new ArrayList<String>();
		Statement stSuper = conn.createStatement();
		String encode = null;
		Blob image = null;
		byte[] imgData = null;
		for(int i=1; i<8;i++) {
			ResultSet rsSuper = stSuper.executeQuery("SELECT data FROM christmasimage WHERE id='" + i + "'");
			if (rsSuper.next()) {
				image = rsSuper.getBlob(1);
				imgData = image.getBytes(1, (int) image.length());
				InputStream input = rsSuper.getBinaryStream(1);
				//OutputStream o = response.getOutputStream();
				//response.setContentType("image/gif");
				//o.write(imgData);
				//o.flush();
				//o.close();
				encode = Base64.getEncoder().encodeToString(imgData);
				bytes.add(encode);
				System.out.println(bytes);
			}
			
			}

		return bytes;
	}

	public List<Product> getProducts() throws SQLException {
		String query = "SELECT * FROM christmasimage";
		
		Statement st = null;
		String encode = null;
		Blob image = null;
		byte[] imgData = null;
		
			st = conn.createStatement();
		
		List<Product> products = new ArrayList<Product>();
	
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				image = rs.getBlob("data");
				imgData = image.getBytes(1, (int) image.length());
				encode = Base64.getEncoder().encodeToString(imgData);
				image=null;
				products.add(new Product(rs.getInt("id"), rs.getString("productname"), rs.getInt("price"),
						rs.getString("description"), rs.getString("category"), image, encode));
			}
		
		return products;
	}

	public List<Product> getProducts(String category) {
		String query = "SELECT * FROM christmasimage WHERE category='" + category + "'";
		Statement st = null;
		String encode = null;
		Blob image = null;
		byte[] imgData = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		List<Product> products = new ArrayList<Product>();
		try {
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				image = rs.getBlob("data");
				imgData = image.getBytes(1, (int) image.length());
				encode = Base64.getEncoder().encodeToString(imgData);
				image=null;
				products.add(new Product(rs.getInt("id"), rs.getString("productname"), rs.getInt("price"),
						rs.getString("description"), rs.getString("category"), image, encode));
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		return products;
	}

	public Product getProduct(int id) {
		String query = "SELECT * FROM christmasimage WHERE id=" + id + "";
		Statement st = null;
		String encode = null;
		Blob image = null;
		byte[] imgData = null;
		try {
			st = conn.createStatement();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		Product product = null;
		try {
			ResultSet rs = st.executeQuery(query);

			while (rs.next()) {
				image = rs.getBlob("data");
				imgData = image.getBytes(1, (int) image.length());
				encode = Base64.getEncoder().encodeToString(imgData);
				image=null;
				product = new Product(rs.getInt("id"), rs.getString("productname"), rs.getInt("price"),
						rs.getString("description"), rs.getString("category"), image, encode);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return product;
	}

}
