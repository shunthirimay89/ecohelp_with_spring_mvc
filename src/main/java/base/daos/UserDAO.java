package base.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import base.dtos.UserResponseDTO;
import base.dtos.UserResquestDTO;



public class UserDAO {
	private static Connection con=null;
	static {
		con=MyConnection.getConnection();
	}
	
	public int createUser(UserResquestDTO reqDto) {
	    int result = 0;
	    String sql = "INSERT INTO user (name, email, password,createDate, updateDate,role,phone,isLocked,address) VALUES (?,?,?,?,?,?,?,?,?)";
	    
	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setString(1, reqDto.getName());
	        ps.setString(2, reqDto.getEmail());
	        ps.setString(3, reqDto.getPassword());
	        ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
	        ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
	        ps.setString(6, reqDto.getRole());
	        ps.setString(7, reqDto.getPhone());
	        ps.setBoolean(8, true);
	        ps.setString(9, reqDto.getAddress());
	        
	        result = ps.executeUpdate();
	    } catch (SQLException e) {
	        System.out.println("Creating user failed: " + e.getMessage());
	        e.printStackTrace();
	    }
	    
	    return result;
	}
	
	

	public UserResponseDTO getUserByEmail(String email) {
	    UserResponseDTO resDto = null; // Initialize to null by default
	    
	    String sql = "SELECT * FROM user WHERE email=?";
	    
	    try (PreparedStatement ps = con.prepareStatement(sql)) {
	        ps.setString(1, email);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            resDto = new UserResponseDTO();
	            resDto.setId(rs.getInt("id"));
	            resDto.setName(rs.getString("name"));
	            resDto.setEmail(rs.getString("email"));
	            resDto.setPassword(rs.getString("password"));
	            resDto.setPhone(rs.getString("phone"));
	            resDto.setRole(rs.getString("role"));
	            resDto.setLocked(rs.getBoolean("isLocked"));
	            resDto.setUpdateDate(rs.getDate("updateDate"));
	            resDto.setAddress(rs.getString("address"));
	            
	            
	             }
	    } catch (SQLException e) {
	        // Handle the exception appropriately, e.g., logging or rethrowing it.
	        System.out.println("Getting user by email failed: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return resDto;
	}
	
	
	public UserResponseDTO getUserById(int id) {
		UserResponseDTO resDto=new UserResponseDTO();
		String sql="SELECT * FROM user WHERE id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				resDto.setId(rs.getInt("id"));
				resDto.setName(rs.getString("name"));
				resDto.setEmail(rs.getString("email"));
				resDto.setPassword(rs.getString("password"));
				resDto.setPhone(rs.getString("phone"));
				resDto.setRole(rs.getString("role"));
				resDto.setLocked(rs.getBoolean("isLocked"));
				resDto.setAddress(rs.getString("address"));
			}
		} catch (SQLException e) {
			System.out.println("Getting user by id is failed"+e.getMessage());
			e.printStackTrace();
		}
		return resDto;
	}
	
	public int updateUser(UserResquestDTO reqDto) {
		int result=0;
		
		String sql = "UPDATE user SET name=?, email=?, phone=?, password=?, updateDate=?, isLocked=?, address=? WHERE id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, reqDto.getName());
			ps.setString(2, reqDto.getEmail());
			ps.setString(3, reqDto.getPhone());
			ps.setString(4, reqDto.getPassword());
			ps.setTimestamp(5, new Timestamp(System.currentTimeMillis()));
			ps.setBoolean(6, reqDto.getLocked());
			ps.setString(7, reqDto.getAddress());
			ps.setInt(8, reqDto.getId());
			result=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Updating user is failed"+e.getMessage());
			e.printStackTrace();
		}
		return result;
	}

	public ArrayList<UserResponseDTO> getAllUsers(){
		ArrayList<UserResponseDTO> list=new ArrayList<UserResponseDTO>();
		String sql="SELECT * FROM user where role='user'";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				UserResponseDTO resDto=new UserResponseDTO();
				resDto.setId(rs.getInt("id"));
				resDto.setName(rs.getString("name"));
				resDto.setEmail(rs.getString("email"));
				resDto.setPassword(rs.getString("password"));
				resDto.setPhone(rs.getString("phone"));
				resDto.setRole(rs.getString("role"));
				resDto.setCreateDate(rs.getDate("createDate"));
				resDto.setUpdateDate(rs.getDate("updateDate"));
				resDto.setLocked(rs.getBoolean("isLocked"));
				resDto.setAddress(rs.getString("address"));
				
				list.add(resDto);
				
			}
		} catch (SQLException e) {
			System.out.println("Getting All users is failed"+e.getMessage());
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<UserResponseDTO> getAllAdmins(){
		ArrayList<UserResponseDTO> adminlist=new ArrayList<UserResponseDTO>();
		String sql="SELECT * FROM user where role='admin'";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				UserResponseDTO resDto=new UserResponseDTO();
				resDto.setId(rs.getInt("id"));
				resDto.setName(rs.getString("name"));
				resDto.setEmail(rs.getString("email"));
				resDto.setPassword(rs.getString("password"));
				resDto.setPhone(rs.getString("phone"));
				resDto.setRole(rs.getString("role"));
				resDto.setCreateDate(rs.getDate("createDate"));
				resDto.setUpdateDate(rs.getDate("updateDate"));
				resDto.setLocked(rs.getBoolean("isLocked"));
				resDto.setAddress(rs.getString("address"));
				
				adminlist.add(resDto);
				
			}
		} catch (SQLException e) {
			System.out.println("Getting All users is failed"+e.getMessage());
			e.printStackTrace();
		}
		
		return adminlist;
	}
	
	
	
	
//	public int banUserbyEmail(String email) {
//		int result=0;
//		String sql="DELETE FROM user WHERE email=?";
//		try {
//			PreparedStatement ps=con.prepareStatement(sql);
//			ps.setString(1, email);
//			result=ps.executeUpdate();
//		} catch (SQLException e) {
//			System.out.println("Banning user by email is failed"+e.getMessage());
//			e.printStackTrace();
//		}
//		
//		return result;
//	}
	
	/*
	 * public int banUser(int id, boolean bol) { int result=0; String
	 * sql="UPDATE user SET locked=? WHERE  id=?"; try { PreparedStatement
	 * ps=con.prepareStatement(sql); ps.setBoolean(1, bol); ps.setInt(2, id);
	 * 
	 * result=ps.executeUpdate();
	 * 
	 * } catch (SQLException e) {
	 * System.out.println("Banning user is failed"+e.getMessage());
	 * e.printStackTrace(); } return result;
	 * 
	 * }
	 */
	
	
	 
}
