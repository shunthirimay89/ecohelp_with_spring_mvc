package base.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import base.daos.PaymentDAO;
import base.daos.UserDAO;
import base.dtos.PaymentResponseDTO;
import base.dtos.UserResponseDTO;
import base.dtos.UserResquestDTO;
import base.models.Payment;
import base.models.UserBean;

import java.util.*;

@Controller
public class UserController {

	@Autowired
	UserDAO userDao;
	
	@Autowired
	PaymentDAO paymentDao;

	// testin git hehe
	@RequestMapping(value = "/Login", method = RequestMethod.GET)
	public String userLoginForm(HttpServletRequest request, ModelMap model) {

		model.addAttribute("user_info", new UserBean());
		return "login";
	}

	@RequestMapping(value = "/userLogin", method = RequestMethod.POST)
	public String userLogin(@ModelAttribute("user_info") @Validated UserBean bean, BindingResult bs, ModelMap model,
			HttpServletRequest request, RedirectAttributes redirect) {

		if (bs.hasErrors()) {
			model.addAttribute("error", "Email and  Password required!");
			return "login";
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
				return "redirect:/Login";
			}

			if (bean.getPassword().equals(resDto.getPassword())) {
				System.out.println("Login Success");
				System.out.println("Role " + resDto.getRole());

				if (resDto.getRole().equals("admin")) {
					session.setAttribute("admin", resDto);
					System.out.println("admin");
					
					//donar list for admin home page
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
					model.addAttribute("currentName", resDto.getName());
					session.setAttribute("loginSuccessMessage", "Login successful");
					return "adminHome";
				} else {
					System.out.println("user");

					session.setAttribute("user", resDto);

				}
				redirect.addFlashAttribute("message", "Sucessfully Login");
				return "redirect:/";
			} else {
				model.addAttribute("passerror", "Incorrect Password!");
				System.out.println("Wrong Password");
				return "login";
			}
		}
		else {
			// User not found or incorrect email
			model.addAttribute("emailerror", "User Not Found!");
			return "userSignUp";
		}
		
	}
	

	@GetMapping("/logout")
	public String logout(HttpServletRequest request , RedirectAttributes redirect) {
		HttpSession session = request.getSession();
		session.removeAttribute("user");
		session.removeAttribute("admin");
		redirect.addFlashAttribute("message", "Sucessfully Logout ! ");
		return "redirect:/";
	}

	@RequestMapping(value = "/userRegister", method = RequestMethod.GET)
	public ModelAndView userRegisterForm() {

		return new ModelAndView("userSignUp", "user_info", new UserBean());
	}

	@RequestMapping(value = "/Register", method = RequestMethod.POST)
	public String userRegister(@ModelAttribute("user_info") @Validated UserBean bean, BindingResult result,
			ModelMap model, HttpServletRequest request) {
		
		System.out.println("Register Here");

		if (result.hasErrors()) {
			model.addAttribute("error", "Name,Email,Address,Phone and Password required!");
			return "userSignUp";
		}

		//email format
		if (!bean.getEmail().endsWith("@gmail.com") || !bean.getEmail().matches(".*[0-9].*")) {
			
		    model.addAttribute("emailError", "Email should end with '@gmail.com' and contain at least one number.");
		    return "userSignUp";
		}
		
		//name format
		char[] nameA = bean.getName().toCharArray();
		if (nameA.length <= 4) {
			model.addAttribute("nameError", "Name should be more than 4 letter!");
			return "userSignUp";
		}
//		for (int i = 0; i < nameA.length; i++) {
//			int ascii = nameA[i];
//
//			if (!(ascii > 64 && ascii < 91 || ascii > 96 && ascii < 123 || ascii == 32)) {
//				model.addAttribute("nameerror", "Name can't contain special character or Number!");
//				return "userSignUp";
//			}
//		}

		// Check if a user with the provided ID already exists in the database
		String email = null;
		UserResponseDTO resDto = userDao.getUserByEmail(bean.getEmail());
		if (resDto != null) {
			model.addAttribute("existerror", "This email is already exist !");
			return "userSignUp";
		}
		else {
			UserResquestDTO reqDto = new UserResquestDTO();
			reqDto.setId(bean.getId());
			reqDto.setName(bean.getName());
			reqDto.setEmail(bean.getEmail());
			reqDto.setPassword(bean.getPassword());
			reqDto.setUpdateDate(bean.getUpdateDate());
			reqDto.setRole("user");
			reqDto.setLocked(bean.getLocked());
			reqDto.setAddress(bean.getAddress());
			reqDto.setPhone(bean.getPhone());
			int rs = userDao.createUser(reqDto);
			System.out.println(rs);
			if (rs == 0) {
				model.addAttribute("inserterror", "Registeration Failed");
				return "userSignUp";
			}
		}
		
		model.addAttribute("regSuccess","Successfully Register , Login Again !");
		return "login";

	}

	@RequestMapping(value = "/userDisplay", method = RequestMethod.GET)
	public String userDisplay(ModelMap model, HttpServletRequest request) {

		if (!isUserAuthenticated(request)) {
			// User is not authenticated. Redirect to the login page.
			return "error";
		}
		ArrayList<UserResponseDTO> dtoList = new ArrayList<UserResponseDTO>();
		dtoList = userDao.getAllUsers();
		ArrayList<UserBean> list = new ArrayList<UserBean>();
		for (UserResponseDTO dto : dtoList) {
			UserBean bean = new UserBean();
			bean.setId(dto.getId());
			bean.setName(dto.getName());
			bean.setEmail(dto.getEmail());
			bean.setPassword(dto.getPassword());
			bean.setCreateDate(dto.getCreateDate());
			bean.setPhone(dto.getPhone());
			bean.setRole(dto.getRole());
			bean.setLocked(dto.getLocked());
			bean.setAddress(dto.getAddress());

			list.add(bean);
		}

		model.addAttribute("list", list);
		return "userDisplay";
	}

	@RequestMapping(value = "/adminDisplay", method = RequestMethod.GET)
	public String adminDisplay(ModelMap model, HttpServletRequest request) {

		if (!isUserAuthenticated(request)) {
			// User is not authenticated. Redirect to the login page.
			return "error";
		}
		ArrayList<UserResponseDTO> dtoList = new ArrayList<UserResponseDTO>();
		dtoList = userDao.getAllAdmins();
		ArrayList<UserBean> adminlist = new ArrayList<UserBean>();
		for (UserResponseDTO dto : dtoList) {
			UserBean bean = new UserBean();
			bean.setId(dto.getId());
			bean.setName(dto.getName());
			bean.setEmail(dto.getEmail());
			bean.setPassword(dto.getPassword());
			bean.setCreateDate(dto.getCreateDate());
			bean.setPhone(dto.getPhone());
			bean.setRole(dto.getRole());
			bean.setLocked(dto.getLocked());
			bean.setAddress(dto.getAddress());

			adminlist.add(bean);
		}

		model.addAttribute("adminList", adminlist);
		return "adminDisplay";
	}

	@RequestMapping(value = "/userUpdate/{id}", method = RequestMethod.GET)
	public String updateUserForm(@PathVariable int id, HttpServletRequest request, ModelMap model) {

		UserResponseDTO resDto = new UserResponseDTO();
		resDto = userDao.getUserById(id);
		UserBean bean = new UserBean();
		bean.setId(resDto.getId());
		bean.setName(resDto.getName());
		bean.setEmail(resDto.getEmail());
		bean.setPassword(resDto.getPassword());
		bean.setPhone(resDto.getPhone());
		bean.setRole("user");
		bean.setLocked(resDto.getLocked());
		bean.setUpdateDate(resDto.getUpdateDate());
		bean.setAddress(resDto.getAddress());

		model.addAttribute("user_info", bean);
		return "userUpdate";
	}

	@RequestMapping(value = "userUpdate", method = RequestMethod.POST)
	public String updateUser(@ModelAttribute("user_info") @Validated UserBean bean, BindingResult bs, ModelMap model) {

		if (bs.hasErrors()) {
			return "userUpdate";
		}

		UserResquestDTO reqDto = new UserResquestDTO();
		reqDto.setId(bean.getId());
		reqDto.setName(bean.getName());
		reqDto.setEmail(bean.getEmail());
		reqDto.setPassword(bean.getPassword());
		reqDto.setPhone(bean.getPhone());
		reqDto.setUpdateDate(bean.getUpdateDate());
		reqDto.setLocked(bean.getLocked());
		reqDto.setAddress(bean.getAddress());

		int rs = userDao.updateUser(reqDto);
		System.out.println(reqDto);
		System.out.println(bean.getId() + bean.getName() + bean.getPassword() + bean.getEmail());

		if (rs == 0) {
			System.out.println("Here is Error");
			model.addAttribute("error", "Updating Failed");
			return "userUpdate";
		}

		return "redirect:/userDisplay";
	}

	@RequestMapping(value = "/banUser/{id}", method = RequestMethod.GET)
	public String banUser(@PathVariable int id, ModelMap model) {
		System.out.println("Id is" + id);
		UserResponseDTO resDto = new UserResponseDTO();

		resDto = userDao.getUserById(id);
		System.out.println(resDto.getId());

		if (resDto.getLocked()) {
			resDto.setLocked(false);
		} else {
			resDto.setLocked(true);
		}
		System.out.println(resDto.getLocked());
		UserResquestDTO reqDto = new UserResquestDTO();
		reqDto.setId(resDto.getId());
		reqDto.setName(resDto.getName());
		reqDto.setEmail(resDto.getEmail());
		reqDto.setPassword(resDto.getPassword());
		reqDto.setPhone(resDto.getPhone());
		reqDto.setLocked(resDto.getLocked());
		reqDto.setAddress(resDto.getAddress());
		int rs = userDao.updateUser(reqDto);
		if (rs == 0) {

			return "userDisplay";
		}
		System.out.println(reqDto);

		// model.addAttribute("banMessage", "You have been banned by the administrator.
		// Please contact support for further information.");

		return "redirect:/userDisplay";
	}

	@RequestMapping(value = "/banAdmin/{id}", method = RequestMethod.GET)
	public String banAdmin(@PathVariable int id, ModelMap model) {
		System.out.println("Id is" + id);
		UserResponseDTO resDto = new UserResponseDTO();

		resDto = userDao.getUserById(id);
		System.out.println(resDto.getId());

		if (resDto.getLocked()) {
			resDto.setLocked(false);
		} else {
			resDto.setLocked(true);
		}
		System.out.println(resDto.getLocked());
		UserResquestDTO reqDto = new UserResquestDTO();
		reqDto.setId(resDto.getId());
		reqDto.setName(resDto.getName());
		reqDto.setEmail(resDto.getEmail());
		reqDto.setPassword(resDto.getPassword());
		reqDto.setPhone(resDto.getPhone());
		reqDto.setLocked(resDto.getLocked());
		reqDto.setAddress(resDto.getAddress());
		int rs = userDao.updateUser(reqDto);
		if (rs == 0) {

			return "adminDisplay";
		}
		System.out.println(reqDto);

		// model.addAttribute("banMessage", "You have been banned by the administrator.
		// Please contact support for further information.");

		return "redirect:/adminDisplay";
	}

	
	
	private boolean isUserAuthenticated(HttpServletRequest request) {
		// Check if the "user" attribute is present in the session.
		UserResponseDTO user = (UserResponseDTO) request.getSession().getAttribute("admin");
		return user != null;
	}
}
