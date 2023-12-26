package base.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

import base.dtos.*;


@Service("payMethodDao")
public class PaymentMethodDAO {

		public static Connection con=null;
		
		static {
			con=MyConnection.getConnection();
		}
		
		public int createPayMethod(PayMethodRequestDTO reqDto) {
			int result=0;
			String sql="INSERT INTO paymentmethod (paymentType) VALUES (?)";
					    
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1, reqDto.getPaymentType());
				
				result=ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println("Creating paymentMethod is failed"+e.getMessage());
				e.printStackTrace();
			}
			return result;
		}

		
		public int updatePayMethod(PayMethodRequestDTO reqDto) {
			int result=0;
			String sql="UPDATE paymentmethod SET paymentType=? WHERE id=?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1, reqDto.getPaymentType());
				
				ps.setInt(2, reqDto.getId());
				result=ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println("Updating paymentMethod is failed"+e.getMessage());
				e.printStackTrace();
			}
			return result;
		}

		
		public int deletePayMethod(int id) {
			int result=0;
			String sql="DELETE FROM paymentmethod WHERE id=?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setInt(1, id);
				result=ps.executeUpdate();
			} catch (SQLException e) {
				System.out.println("Deleting paymentMethod is failed"+e.getMessage());
				e.printStackTrace();
			}
			return result;
		}

		
		public PayMethodResponseDTO getPayMethodById(int id) {
			PayMethodResponseDTO resDto=new PayMethodResponseDTO();
			String sql="SELECT * FROM paymentmethod WHERE id=?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setInt(1, id);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					resDto.setId(rs.getInt("id"));
					resDto.setPaymentType(rs.getString("paymentType"));
					
				}
			} catch (SQLException e) {
				System.out.println("Selecting PaymentMethod is failed"+e.getMessage());
				e.printStackTrace();
			}
			
			return resDto;
		}
		
		public PayMethodResponseDTO getPayMethodByName(String paymethod) {
			PayMethodResponseDTO resDto=new PayMethodResponseDTO();
			String sql="SELECT * FROM paymentmethod WHERE paymentType=?";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ps.setString(1, paymethod);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
				  resDto.setId(rs.getInt("id"));
					resDto.setPaymentType(rs.getString("paymentType"));
					
				}
			} catch (SQLException e) {
				System.out.println("Selecting PaymentMethod is failed"+e.getMessage());
				e.printStackTrace();
			}
			
			return resDto;
		}
		
		public ArrayList<PayMethodResponseDTO> getAllPayMethod(){
			ArrayList<PayMethodResponseDTO> list=new ArrayList<PayMethodResponseDTO>();
			String sql="SELECT * FROM paymentmethod ";
			try {
				PreparedStatement ps=con.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				while(rs.next()) {
					PayMethodResponseDTO resDto=new PayMethodResponseDTO();
					resDto.setId(rs.getInt("id"));
					resDto.setPaymentType(rs.getString("paymentType"));
					
					
					list.add(resDto);
				}
			} catch (SQLException e) {
				System.out.println("Getting All paymentMethod is failed"+e.getMessage());
				e.printStackTrace();
			}
			return list;
		}
}
