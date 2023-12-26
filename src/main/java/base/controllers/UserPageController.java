package base.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import base.daos.UserDAO;
import base.dtos.PaymentResponseDTO;
import base.dtos.UserResponseDTO;
import base.models.Payment;
import base.models.UserBean;

@Controller
public class UserPageController {
	@Autowired
	UserDAO userDao;

	// testin git hehe
	@RequestMapping(value = "/pageLogin", method = RequestMethod.GET)
	public String userpageLogin(HttpServletRequest request, ModelMap model) {

		model.addAttribute("user_info", new UserBean());
		return "userpageLogin";
	}

	@RequestMapping(value = "/pageLogin", method = RequestMethod.POST)
	public String userLogin(@ModelAttribute("user_info") @Validated UserBean bean, BindingResult bs, ModelMap model,
			HttpServletRequest request, RedirectAttributes redirect) {

		if (bs.hasErrors()) {
			model.addAttribute("error", "Email and  Password required!");
			return "userpageLogin";
		}
		
		HttpSession session = request.getSession();

		String email = bean.getEmail();
		UserResponseDTO resDto = new UserResponseDTO();
		resDto = userDao.getUserByEmail(email);
		System.out.println(resDto);

		if (resDto != null) {
			System.out.println(bean.getPassword() + "password form jsp");
			System.out.println(resDto.getPassword() + "password form db");

			if (!resDto.getLocked()) {
				redirect.addFlashAttribute("banMessage", "You have been banned by the administrator. "
						+ "Please contact support for further information.");
				System.out.println("Banned");
				return "redirect:/pageLogin";
			}

			if (bean.getPassword().equals(resDto.getPassword())) {
				System.out.println("Login Success");
				System.out.println("Role " + resDto.getRole());

				if (resDto.getRole().equals("admin")) {
					session.setAttribute("admin", resDto);
					System.out.println("admin");
					
					//donar list for admin home page
			
					model.addAttribute("currentName", resDto.getName());
					session.setAttribute("loginSuccessMessage", "Login successful");
					return "adminHome";
				} else {
					System.out.println("user");

					session.setAttribute("user", resDto);

				}
				redirect.addFlashAttribute("message", "Sucessfully Login");
				return "redirect:/donateplace";
			} else {
				model.addAttribute("passerror", "Incorrect Password!");
				System.out.println("Wrong Password");
				return "userpageLogin";
			}
		}
		else {
			// User not found or incorrect email
			model.addAttribute("emailerror", "User Not Found!");
			return "userSignUp";
		}
		
	}

}
