package base.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import base.dtos.DonateRequestDTO;
import base.dtos.DonateResponseDTO;

public class DonatePlaceDAO {
	private static Connection con=null;
	static {
		con=MyConnection.getConnection();
	}
	
	public int insertPlace(DonateRequestDTO reqDto) {
		int result=0;
		String sql="INSERT INTO donateplace (placename,imagepath,createDate,updateDate,description,category_id) VALUES (?,?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setString(1, reqDto.getName());
			ps.setString(2, reqDto.getImagePath());
			ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			ps.setTimestamp(4, new Timestamp(System.currentTimeMillis()));
			ps.setString(5, reqDto.getDescription());
			ps.setInt(6, reqDto.getDonatesector_id());
			result=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Inserting place is failed");
			e.printStackTrace();
		}
		return result;
	}
	
	public ArrayList<DonateResponseDTO> getAllPlaces(){
		ArrayList<DonateResponseDTO> list=new ArrayList<DonateResponseDTO>();
		String sql="SELECT * FROM donateplace INNER JOIN category ON donateplace.category_id =category.id";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				DonateResponseDTO resDto=new DonateResponseDTO();
				resDto.setId(rs.getInt("id"));
				resDto.setName(rs.getString("placename"));
				resDto.setImagePath(rs.getString("imagepath"));
				resDto.setDescription(rs.getString("description"));
				resDto.setCreateDate(rs.getDate("createDate"));
				resDto.setDonatesector_id(rs.getInt("category_id"));
				resDto.setDonatesector_name(rs.getString("sectorName"));
				list.add(resDto);
			}
		} catch (SQLException e) {
			System.out.println("Getting All places is failed"+e.getMessage());
			e.printStackTrace();
		}
		return list;
	}
	
	public DonateResponseDTO getPlaceById(int id) {
		DonateResponseDTO resDto=new DonateResponseDTO();
		String sql="SELECT * FROM  donateplace WHERE id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				resDto.setId(rs.getInt("id"));
				resDto.setName(rs.getString("placename"));
				resDto.setImagePath(rs.getString("imagepath"));
				resDto.setDescription(rs.getString("description"));
				resDto.setDonatesector_id(rs.getInt("category_id"));
			}
		} catch (SQLException e) {
			System.out.println("Getting Place by Id is failed!"+e.getMessage());
			e.printStackTrace();
		}
		return resDto;
	}

	public int updatePlace(DonateRequestDTO reqDto) {
		int result=0;
		String sql="UPDATE donateplace SET placename=?,imagepath=?,updateDate=?,description=? ,category_id=?  WHERE id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			
			ps.setString(1, reqDto.getName());
			ps.setString(2, reqDto.getImagePath());
			ps.setTimestamp(3, new Timestamp(System.currentTimeMillis()));
			ps.setString(4, reqDto.getDescription());
			ps.setInt(5, reqDto.getDonatesector_id());
			ps.setInt(6, reqDto.getId());
			result=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Updating place is failed"+e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}
	
public int deletePlace(int id) {
		
	    // Delete related records in child tables
	    deletePlaceByDonatePlaceId(id);

	    int result = 0;
	    String sql = "DELETE FROM donateplace WHERE id=?";
	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, id);
	        result = ps.executeUpdate();
	    } catch (SQLException e) {
	        System.out.println("Deleting place is failed: " + e.getMessage());
	        e.printStackTrace();
	    }

	    return result;
	}

	private void deletePlaceByDonatePlaceId(int id) {
	    String sql = "DELETE FROM payment WHERE donatePlace_id = ?";
	    try {
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, id);
	        ps.executeUpdate();
	    } catch (SQLException e) {
	        System.out.println("Deleting payment by donateplace_id is failed: " + e.getMessage());
	        e.printStackTrace();
	    }
	}
	public ArrayList<DonateResponseDTO> getPlaceByCatId(int id) {
		ArrayList<DonateResponseDTO> list=new ArrayList<DonateResponseDTO>();
		String sql="SELECT * FROM  donateplace WHERE category_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				DonateResponseDTO resDto=new DonateResponseDTO();
				resDto.setId(rs.getInt("id"));
				resDto.setName(rs.getString("placename"));
				resDto.setImagePath(rs.getString("imagepath"));
				resDto.setCreateDate(rs.getDate("createDate"));
				resDto.setDescription(rs.getString("description"));
				resDto.setDonatesector_id(rs.getInt("category_id"));
				
				list.add(resDto);
			}
		} catch (SQLException e) {
			System.out.println("Getting Place by Id is failed!"+e.getMessage());
			e.printStackTrace();
		}
		return list;
	}
}
