package base.controllers;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import base.daos.PaymentDAO;
import base.dtos.PaymentResponseDTO;
import base.models.Payment;

@Controller
public class HomeController {
	@Autowired
	PaymentDAO paymentDao;
	
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String view() {
		return  "homepage";
	}
	
}
