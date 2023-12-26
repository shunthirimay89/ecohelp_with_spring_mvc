package base.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import base.dtos.DonateResponseDTO;
import base.dtos.SectorRequestDTO;
import base.dtos.SectorResponseDTO;

public class SectorDAO {
	public static Connection con=null;
	
	static {
		con=MyConnection.getConnection();
	}
	
	public int createDonateSector(SectorRequestDTO reqDto) {
		int result=0;
		String sql="INSERT INTO category (sectorName) VALUES (?)";
				    
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, reqDto.getName());
			result=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Creating Sector is failed"+e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public int updateDonateSector(SectorRequestDTO reqDto) {
		int result=0;
		String sql="UPDATE category SET sectorName=? WHERE id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, reqDto.getName());
			ps.setInt(2, reqDto.getId());
			result=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Updating sector is failed"+e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public int deleteDonateSector(int id) {
		int result=0;
		String sql="DELETE FROM category WHERE id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			result=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Deleting sector is failed"+e.getMessage());
			e.printStackTrace();
		}
		return result;
	}
	
	public SectorResponseDTO getSectorById(int id) {
		SectorResponseDTO resDto=new SectorResponseDTO();
		String sql="SELECT * FROM category WHERE id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				resDto.setId(rs.getInt("id"));
				resDto.setName(rs.getString("sectorName"));
			}
		} catch (SQLException e) {
			System.out.println("Selecting category is failed"+e.getMessage());
			e.printStackTrace();
		}
		
		return resDto;
	}
	
	public ArrayList<SectorResponseDTO> getAllSectors(){
		ArrayList<SectorResponseDTO> list=new ArrayList<SectorResponseDTO>();
		String sql="SELECT * FROM category ";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				SectorResponseDTO resDto=new SectorResponseDTO();
				resDto.setId(rs.getInt("id"));
				resDto.setName(rs.getString("sectorName"));
				
				
				list.add(resDto);
			}
		} catch (SQLException e) {
			System.out.println("Getting All places is failed"+e.getMessage());
			e.printStackTrace();
		}
		return list;
	}
}
