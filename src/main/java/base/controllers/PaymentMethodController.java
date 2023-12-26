package base.controllers;



import javax.servlet.http.HttpServletRequest;
import java.util.*;
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

import base.daos.PaymentMethodDAO;
import base.dtos.*;
import base.models.*;

@Controller
public class PaymentMethodController {
		
	@Autowired
	
	PaymentMethodDAO payMethodDao;
	
	
	@RequestMapping(value="/displayPayMethod", method=RequestMethod.GET)
	public String displayPayMethod(ModelMap model,HttpServletRequest request) {
		
		if (!isUserAuthenticated(request)) {
            // User is not authenticated. Redirect to the login page.
            return "error";
        }
		
		
		ArrayList<PayMethodResponseDTO> dtoList=new ArrayList<PayMethodResponseDTO>();
		dtoList=payMethodDao.getAllPayMethod();
		
		ArrayList<PaymentMethod> paymentList=new ArrayList<PaymentMethod>();
		for(PayMethodResponseDTO dto:dtoList) {
			PaymentMethod payment=new PaymentMethod();
			payment.setId(dto.getId());
			payment.setPaymentType(dto.getPaymentType());
		
			
			paymentList.add(payment);
			}
		
		model.addAttribute("paymentList",paymentList);
		
		
		return "displayPayMethod";
	}
	
	@RequestMapping(value="/createPayMethod",method=RequestMethod.GET)
	public ModelAndView createSectorForm() {
		return new ModelAndView("createPayMethod","paymethod_info",new PaymentMethod());
	}
	
	@RequestMapping(value="/createPayMethod", method=RequestMethod.POST)
	public String createSector(@ModelAttribute("paymethod_info") @Validated PaymentMethod payment,ModelMap model,HttpServletRequest request) {
		System.out.println("From jsp : " + payment.getPaymentType());
		
//		if (bs.hasErrors()) {
//		    for (FieldError error : bs.getFieldErrors()) {
//		        System.out.println("Field: " + error.getField() + " - Error: " + error.getDefaultMessage());
//		    }
//		    model.addAttribute("error", "Creating paymentMethod is failed");
//		    return "createPayMethod";
//		}
		String paymentType = null;
		PayMethodResponseDTO resDto = payMethodDao.getPayMethodByName(payment.getPaymentType());		
		if (resDto != null) {
			model.addAttribute("existerror", "This paymentType is already exist !");
			return "createPayMethod";
		}
		else {
		
		
	    

	    
		
		PayMethodRequestDTO reqDto=new PayMethodRequestDTO();
		reqDto.setId(payment.getId());
		reqDto.setPaymentType(payment.getPaymentType());
		
		System.out.println(reqDto.getPaymentType());
		
		
		int rs=payMethodDao.createPayMethod(reqDto);
		if(rs==0) {
			System.out.println("Nothing Here");
			return "createPayMethod";
		}
		System.out.println("Save Successfully");
		return "redirect:/displayPayMethod";
	}
	}
	@RequestMapping(value="/deletePayMethod/{id}", method=RequestMethod.GET)
	public String deletePayMethod(@PathVariable int id) {
		int rs=payMethodDao.deletePayMethod(id);
		if (rs==0) {
			return "displayPayMethod";
		}
		
		return "redirect:/displayPayMethod";
	}
	
	
	@RequestMapping(value="/updatePayMethod/{id}",method=RequestMethod.GET)
	public ModelAndView updatePayMethodForm(@PathVariable int id) {
		PayMethodResponseDTO resDto=new PayMethodResponseDTO();
		resDto=payMethodDao.getPayMethodById(id);
		PaymentMethod payment=new PaymentMethod();
		payment.setId(resDto.getId());
		payment.setPaymentType(resDto.getPaymentType());
		
		return new ModelAndView ("updatePayMethod","paymethod_info", payment);
	}
	
	@RequestMapping(value="/updatePayMethod", method=RequestMethod.POST)
	public String updateSector(@ModelAttribute("paymethod_info")@Validated PaymentMethod payment,BindingResult bs,ModelMap model,HttpServletRequest request) {
		if(bs.hasErrors()) {
			return "updatePayMethod";
		}

		
	    
	     System.out.println("after image uploaded : " + payment);
		PayMethodRequestDTO reqDto=new PayMethodRequestDTO();
		reqDto.setId(payment.getId());
		reqDto.setPaymentType(payment.getPaymentType());
		
		int rs=payMethodDao.updatePayMethod(reqDto);
		if (rs==0) {
			System.out.println("Nothing Here");
			return "updatePayMethod";
		}
		
		return "redirect:/displayPayMethod";
	}
	
	
		
	
	
	
	private boolean isUserAuthenticated(HttpServletRequest request) {
        // Check if the "user" attribute is present in the session.
        UserResponseDTO user = (UserResponseDTO) request.getSession().getAttribute("admin");
        return user != null;
    }
}
