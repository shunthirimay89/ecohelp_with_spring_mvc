package base.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import base.dtos.PaymentRequestDTO;
import base.dtos.PaymentResponseDTO;

@Service("paymentDao")
public class PaymentDAO {
	
	public static Connection con=null;
	
	static {
		con=MyConnection.getConnection();
	}
	
	public int createPayment(PaymentRequestDTO reqDto) {
		int result=0;
		String sql="INSERT INTO payment (donationDate,amount,donatePlace_id,user_id,paymentmethod_id) VALUES(?,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			
			
			ps.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
			ps.setDouble(2, reqDto.getAmount());
			ps.setInt(3, reqDto.getDonateplace_id());
			ps.setInt(4, reqDto.getUser_id());
			ps.setInt(5, reqDto.getPaymentmethod_id());
			result=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.println("Inserting payment is failed"+e.getMessage());
			e.printStackTrace();
		}
		
		return result;
	}

	public int updatePayment(PaymentRequestDTO reqDto) {
		int result=0;
		String sql="UPDATE payment SET donationDate=?,amount=?,donatePlace_id=?,user_id=?, paymentmethod_id=? WHERE id=? ";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
			ps.setDouble(2, reqDto.getAmount());
			ps.setInt(3, reqDto.getDonateplace_id());
			ps.setInt(4, reqDto.getUser_id());
			ps.setInt(5, reqDto.getPaymentmethod_id());
			ps.setInt(6, reqDto.getId());
		} catch (SQLException e) {
			System.out.println("Updating payment is failed"+e.getMessage());
			e.printStackTrace();
		}
		return result;
	}

	public int deletePayment(int id) {
		int result=0;
		String sql="DELETE FROM payment  WHERE id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
		} catch (SQLException e) {
			System.out.println("Deleting payment is failed"+e.getMessage());
			e.printStackTrace();
		}
		return result;
	}

	public PaymentResponseDTO getPaymentById() {
		PaymentResponseDTO resDto=new PaymentResponseDTO();
		String sql="SELECT * FROM payment WHERE id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			while (rs.next()) {
				
				resDto.setId(rs.getInt("id"));
				resDto.setDonationDate(rs.getDate("donationDate"));
				resDto.setAmount(rs.getDouble("amount"));
				resDto.setDonateplace_id(rs.getInt("donatePlace_id"));
				resDto.setUser_id(rs.getInt("user_id"));
				resDto.setPaymentmethod_id(rs.getInt("paymentmethod_id"));
			}
		} catch (SQLException e) {
			System.out.println("Getting payment by id is failed"+e.getMessage());
			e.printStackTrace();
		}
		return resDto;
	}
	
	public ArrayList<PaymentResponseDTO> getAllPayment(){
		ArrayList<PaymentResponseDTO> list=new ArrayList<PaymentResponseDTO>();
		String sql="SELECT "
				+ "    *"
				+ "FROM"
				+ "    payment"
				+ "        INNER JOIN"
				+ "    user ON payment.user_id = user.id"
				+ "        INNER JOIN"
				+ "    donateplace ON payment.donatePlace_id = donateplace.id"
				+ "    INNER JOIN"
				+ "    paymentmethod ON payment.paymentmethod_id = paymentmethod.id";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				PaymentResponseDTO resDto=new PaymentResponseDTO();
				resDto.setId(rs.getInt("id"));
				resDto.setDonationDate(rs.getDate("donationDate"));
				resDto.setAmount(rs.getDouble("amount"));
				resDto.setDonateplace_id(rs.getInt("donatePlace_id"));
				resDto.setDonateplace_name(rs.getString("placename"));
				resDto.setUser_id(rs.getInt("user_id"));
				resDto.setUser_name(rs.getString("name"));
				resDto.setPaymentmethod_id(rs.getInt("paymentmethod_id"));
				resDto.setPaymentmethod_name(rs.getString("paymentType"));
				resDto.setUser_address(rs.getString("address"));
				
				list.add(resDto);
			}
		} catch (SQLException e) {
			System.out.println("Getting all payment is failed"+e.getMessage());
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<PaymentResponseDTO> getAllUserbyPlace(int id){
		ArrayList<PaymentResponseDTO> userlist=new ArrayList<PaymentResponseDTO>();
		String sql="SELECT * FROM payment INNER JOIN user ON payment.user_id=user.id WHERE donatePlace_id = ?";
		
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				PaymentResponseDTO resDto=new PaymentResponseDTO();
				resDto.setId(rs.getInt("id"));
				resDto.setAmount(rs.getDouble("amount"));
				resDto.setDonationDate(rs.getDate("donationDate"));
				resDto.setDonateplace_id(rs.getInt("donateplace_id"));
				resDto.setUser_id(rs.getInt("user_id"));
				resDto.setUser_name(rs.getString("name"));
				resDto.setUser_address(rs.getString("address"));
				
				userlist.add(resDto);
			}
		} catch (SQLException e) {
			System.out.println("Get All user by Place is failed"+e.getMessage());
			e.printStackTrace();
		}
		return userlist;
	}
	
	public ArrayList<PaymentResponseDTO> donatedHistoryByUserId(int id) {
		
		ArrayList<PaymentResponseDTO> userlist=new ArrayList<PaymentResponseDTO>();
		String sql="SELECT * FROM payment INNER JOIN donateplace ON payment.donatePlace_id = donateplace.id INNER JOIN user ON payment.user_id=user.id WHERE user_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			while (rs.next()) {
				PaymentResponseDTO resDto=new PaymentResponseDTO();
				resDto.setId(rs.getInt("id"));
				resDto.setAmount(rs.getDouble("amount"));
				resDto.setDonationDate(rs.getDate("donationDate"));
				resDto.setDonateplace_id(rs.getInt("donateplace_id"));
				resDto.setDonateplace_name(rs.getString("placename"));
				resDto.setUser_id(rs.getInt("user_id"));
				resDto.setUser_name(rs.getString("name"));
				resDto.setUser_address(rs.getString("address"));
				
				userlist.add(resDto);
			}
		} catch (SQLException e) {
			System.out.println("donatedHistory by user id is failed"+e.getMessage());
			e.printStackTrace();
		}
		return userlist;
	}
	
}
