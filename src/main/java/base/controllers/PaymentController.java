package base.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import base.dtos.*;
import base.daos.DonatePlaceDAO;
import base.daos.PaymentDAO;
import base.daos.PaymentMethodDAO;

import base.models.Payment;
import base.models.PaymentMethod;

import base.models.DonatePlace;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
@Controller
public class PaymentController {

	@Autowired
	PaymentDAO paymentDao;
	
	@Autowired
	PaymentMethodDAO payMethodDao;
	
	@Autowired
	DonatePlaceDAO donateDao;
	

	
	@RequestMapping(value="/createPayment/{id}", method=RequestMethod.GET)
	public ModelAndView createPaymentForm( @PathVariable int id, ModelMap model) {
		
		DonateResponseDTO donateResDto= new DonateResponseDTO();
		donateResDto=donateDao.getPlaceById(id);
		DonatePlace bean=new DonatePlace();
		bean.setId(donateResDto.getId());
		bean.setName(donateResDto.getName());
		
		
		ArrayList<PayMethodResponseDTO> dtoList=new ArrayList<PayMethodResponseDTO>();
		dtoList=payMethodDao.getAllPayMethod();
		
		ArrayList<PaymentMethod> paymentList=new ArrayList<PaymentMethod>();
		for(PayMethodResponseDTO dto:dtoList) {
			PaymentMethod payment=new PaymentMethod();
			payment.setId(dto.getId());
			payment.setPaymentType(dto.getPaymentType());
			
			paymentList.add(payment);
			}
		
		model.addAttribute("bean", bean);
		System.out.println(bean.getName());
		model.addAttribute("paymentList",paymentList);
		
		return new ModelAndView ("createPayment", "payment_info", new Payment());
	}
	
	
	
	@RequestMapping(value="/createPayment", method=RequestMethod.POST)
	public String cretePayment(@ModelAttribute("payment_info") @Validated Payment pay,BindingResult bs, ModelMap model,HttpServletRequest request) {
		

	    if (pay.getAmount() == null || pay.getAmount() < 0.01) {
	    	 model.addAttribute( "amount", "Amount must be greater than or equal to 0.01");
	    }
		
		 if(bs.hasErrors()) { System.out.println("Binding Error");
		 model.addAttribute("error", "Amount and Method must be included"); 
		 return "createPayment";
		 }
		 
		// Assuming you have a User class with a getId() method and a user object after successful login
		 HttpSession session = request.getSession();
       UserResponseDTO user =(UserResponseDTO) session.getAttribute("user");
		 
		 pay.setUser_id(user.getId());
		
		  DonateResponseDTO donateplace = donateDao.getPlaceById(pay.getDonateplace_id());
		 PaymentRequestDTO reqDto=new PaymentRequestDTO();
		 reqDto.setId(pay.getId());
		 reqDto.setDonationDate(pay.getDonationDate());
	     reqDto.setUser_name(pay.getUser_name());
		 reqDto.setAmount(pay.getAmount());
		 reqDto.setDonateplace_id(pay.getDonateplace_id());
		 reqDto.setUser_id(pay.getUser_id());
		 reqDto.setPaymentmethod_id(pay.getPaymentmethod_id());
		
		 int rs=paymentDao.createPayment(reqDto);
	 
		 if(rs==0) {
			 System.out.println("nothing here");
	    
			 return "createPayment";
		 }
		 
		 model.addAttribute("amount", reqDto.getAmount());
		model.addAttribute("place", donateplace.getName());
		return "receipt";
	}
		 
	
	@RequestMapping(value="/donarList", method=RequestMethod.GET)
	public String paymentList(ModelMap model) {
		
		ArrayList<PaymentResponseDTO> paymentList=new ArrayList<PaymentResponseDTO>();
		paymentList=paymentDao.getAllPayment();
		ArrayList<Payment> list=new ArrayList<Payment>();
		for(PaymentResponseDTO dto:paymentList) {
			Payment pay=new Payment();
			pay.setId(dto.getId());
			pay.setAmount(dto.getAmount());
			pay.setDonationDate(dto.getDonationDate());
			pay.setDonateplace_id(dto.getDonateplace_id());
			pay.setDonateplace_name(dto.getDonateplace_name());
			pay.setUser_id(dto.getUser_id());
			pay.setUser_name(dto.getUser_name());
			pay.setPaymentmethod_id(dto.getPaymentmethod_id());
			pay.setPaymentmethod_name(dto.getPaymentmethod_name());
			pay.setUser_address(dto.getUser_address());
			
			list.add(pay);
		}
		model.addAttribute("list", list);
		return "donarList";
	}
	
	@RequestMapping(value="/donatedList/{id}", method=RequestMethod.GET)
	public String showDonatedUserListByPlace( @PathVariable int id, ModelMap model) {
		
		ArrayList<PaymentResponseDTO> dtoList=new ArrayList<PaymentResponseDTO>();
		dtoList = paymentDao.getAllUserbyPlace(id);
		
		System.out.println("dto "+ dtoList);
		ArrayList<Payment> userList=new ArrayList<Payment>();
		for(PaymentResponseDTO dto:dtoList) {
			Payment pay=new Payment();
			pay.setId(dto.getId());
			pay.setAmount(dto.getAmount());
			pay.setDonationDate(dto.getDonationDate());
			pay.setDonateplace_id(dto.getDonateplace_id());
			pay.setDonateplace_name(dto.getDonateplace_name());
			pay.setUser_id(dto.getUser_id());
			pay.setUser_name(dto.getUser_name());
			pay.setUser_address(dto.getUser_address());
			pay.setPaymentmethod_id(dto.getPaymentmethod_id());
			pay.setPaymentmethod_name(dto.getPaymentmethod_name());
			
			userList.add(pay);
		}
		
		
		model.addAttribute("userList", userList);
		System.out.println("userList " + userList);
		
		return "donarListByPlace";
	}
	
	
	@RequestMapping(value="/historyDonated/{id}", method=RequestMethod.GET)
	public String donatedHistorybyUser(@PathVariable int id,ModelMap model) {
		
		ArrayList<PaymentResponseDTO> dtoList=new ArrayList<PaymentResponseDTO>();
		dtoList = paymentDao.donatedHistoryByUserId(id);
		
		System.out.println("dto "+ dtoList);
		ArrayList<Payment> userList=new ArrayList<Payment>();
		for(PaymentResponseDTO dto:dtoList) {
			Payment pay=new Payment();
			pay.setId(dto.getId());
			pay.setAmount(dto.getAmount());
			pay.setDonationDate(dto.getDonationDate());
			pay.setDonateplace_id(dto.getDonateplace_id());
			pay.setDonateplace_name(dto.getDonateplace_name());
			pay.setUser_id(dto.getUser_id());
			pay.setUser_name(dto.getUser_name());
			pay.setUser_address(dto.getUser_address());
			pay.setPaymentmethod_id(dto.getPaymentmethod_id());
			pay.setPaymentmethod_name(dto.getPaymentmethod_name());
			
			userList.add(pay);
		}
		
		
		model.addAttribute("userList", userList);
		System.out.println("userList " + userList);
		
		
		
		 return "donatedHistory";
	}


	
	
}