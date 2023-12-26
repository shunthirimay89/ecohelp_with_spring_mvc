package base.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import base.daos.DonatePlaceDAO;
import base.daos.SectorDAO;
import base.models.DonatePlace;
import base.models.DonateSector;
import base.dtos.*;
import java.util.*;
@Controller
public class DonatePlaceController {
	@Autowired
	DonatePlaceDAO donateDao;
	@Autowired
	SectorDAO sectorDao;
	
	@RequestMapping(value="/payment", method=RequestMethod.GET)
	public String view1() {
		return  "paymentMethod";
	}
	@RequestMapping(value="/createplace", method=RequestMethod.GET)
	public ModelAndView createPlaceForm(ModelMap model) {
		ArrayList<SectorResponseDTO> dtoList=new ArrayList<SectorResponseDTO>();
		dtoList=sectorDao.getAllSectors();
		
		ArrayList<DonateSector> list=new ArrayList<DonateSector>();
		for(SectorResponseDTO dto:dtoList) {
			DonateSector sector=new DonateSector();
			sector.setId(dto.getId());
			sector.setName(dto.getName());
			
			
			list.add(sector);
			}
		
		model.addAttribute("list",list);
		return  new ModelAndView ("createplace","donate_info",new DonatePlace());
	}
	
	@RequestMapping(value="/createplace", method=RequestMethod.POST)
	public String createPlace(@ModelAttribute("donate_info") @Validated DonatePlace bean,BindingResult bs,ModelMap model,HttpServletRequest request) {
		if(bs.hasErrors()) {
			System.out.println("Nothing Here!");
			return "createplace";
		}
		MultipartFile file = bean.getFile();
		String image = null;
	    if (file != null && !file.isEmpty()) {
	    	 String originalFilename = file.getOriginalFilename();
	    	 if (originalFilename != null && (originalFilename.endsWith(".jpg") || originalFilename.endsWith(".jpeg") || originalFilename.endsWith(".png") || originalFilename.endsWith(".gif") )) {
	    	        image = uploadImage(file, request);
	    	        bean.setImagePath(image);
	    	    }
	    	 else {
	    	        System.err.println("Uploaded file is not an allowed image type.");
	    	        
	    	        model.addAttribute("imageerror", "Uploaded file is not an allowed image type.");
	    	        return "createplace";
	    	    }
	        //share for git
	    	 //STH test for git
	    }

	    System.out.println("after image uploaded : " + bean);
		
		DonateRequestDTO reqDto=new DonateRequestDTO();
		reqDto.setId(bean.getId());
		reqDto.setName(bean.getName());
		reqDto.setDescription(bean.getDescription());
		reqDto.setImagePath(bean.getImagePath());
		reqDto.setCreateDate(bean.getCreateDate());
		reqDto.setDonatesector_id(bean.getDonatesector_id());
		int rs=donateDao.insertPlace(reqDto);
		if(rs==0) {
			model.addAttribute("error","Inserting is failed");
			return "createplace";
		}
		System.out.println(bean.getFile());
		return "redirect:/displayplace";
	}
	
	

	@RequestMapping(value="/displayplace", method=RequestMethod.GET)
	public String displayPlace(ModelMap model,HttpServletRequest request) {
		
		 if (!isUserAuthenticated(request)) {
	            // User is not authenticated. Redirect to the login page.
	            return "error";
	        }
		
		ArrayList<DonateResponseDTO> dtoList=new ArrayList<DonateResponseDTO>();
		dtoList=donateDao.getAllPlaces();
		
		ArrayList<DonatePlace> list=new ArrayList<DonatePlace>();
		for(DonateResponseDTO dto:dtoList) {
			DonatePlace bean=new DonatePlace();
			bean.setId(dto.getId());
			bean.setName(dto.getName());
			bean.setImagePath(dto.getImagePath());
			bean.setDescription(dto.getDescription());
			bean.setDonatesector_id(dto.getDonatesector_id());
			bean.setDonatesector_name(dto.getDonatesector_name());
			list.add(bean);
			}
		
		model.addAttribute("list",list);
		return "displayplace";
		
	}
	
	@RequestMapping (value="/updateplace/{id}", method=RequestMethod.GET)
	public ModelAndView updatePlaceForm(@PathVariable int id,ModelMap model) {
		DonateResponseDTO resDto=new DonateResponseDTO();
		resDto=donateDao.getPlaceById(id);
		DonatePlace bean=new DonatePlace();
		bean.setId(resDto.getId());
		bean.setName(resDto.getName());
		bean.setUpdateDate(resDto.getUpdateDate());
		bean.setImagePath(resDto.getImagePath()); // Set the image path
		bean.setDescription(resDto.getDescription());
		bean.setDonatesector_id(resDto.getDonatesector_id());
		bean.setDonatesector_name(resDto.getDonatesector_name());
		System.out.println(bean);
		
		
		ArrayList<SectorResponseDTO> dtoList=new ArrayList<SectorResponseDTO>();
		dtoList=sectorDao.getAllSectors();
		
		ArrayList<DonateSector> list=new ArrayList<DonateSector>();
		for(SectorResponseDTO dto:dtoList) {
			DonateSector sector=new DonateSector();
			sector.setId(dto.getId());
			sector.setName(dto.getName());
			
			
			list.add(sector);
			}
		
		model.addAttribute("list",list);
		
		
		return new ModelAndView ("updateplace","donate_info", bean);
	}
	
	@RequestMapping(value="/updateplace",method=RequestMethod.POST)
	public String updatePlace(@ModelAttribute("donate_info") @Validated DonatePlace bean,BindingResult bs,ModelMap model,HttpServletRequest request) {
		if(bs.hasErrors()) {
			System.out.println("Nothing Here");
			return "updateplace";
			
			}
		
		MultipartFile file = bean.getFile();
		String returnImage = null;
	    if (file != null && !file.isEmpty()) {
	    	String originalFilename = file.getOriginalFilename();
	    	 if (originalFilename != null && (originalFilename.endsWith(".jpg") || originalFilename.endsWith(".jpeg") || originalFilename.endsWith(".png") || originalFilename.endsWith(".gif") )) {
	    	        returnImage = uploadImage(file, request);
	    	        bean.setImagePath(returnImage);
	    	    }
	    	 else {
	    	        System.err.println("Uploaded file is not an allowed image type.");
	    	        
	    	        model.addAttribute("imageerror", "Uploaded file is not an allowed image type.");
	    	        return "updateplace";
	       
	    }
	    }
	    
	     System.out.println("after image uploaded : " + bean);
	     
	     DonateRequestDTO reqDto=new DonateRequestDTO();
			reqDto.setId(bean.getId());
			reqDto.setName(bean.getName());
			reqDto.setDescription(bean.getDescription());
			reqDto.setImagePath(bean.getImagePath());
			reqDto.setUpdateDate(bean.getUpdateDate());
			reqDto.setDonatesector_id(bean.getDonatesector_id());
			reqDto.setDonatesector_name(bean.getDonatesector_name());
			int rs=donateDao.updatePlace(reqDto);
			//System.out.println("Hello Here!");
			if(rs==0) {
				System.out.println("I'm Here!");
				model.addAttribute("error","Inserting is failed");
				return "updateplace";
			}
			System.out.println(bean.getFile());
			
		return "redirect:/displayplace";
	}
	
	@RequestMapping(value="/deleteplace/{id}",method=RequestMethod.GET)
	public String deletePlace(@PathVariable int id,ModelMap model) {
		int rs=donateDao.deletePlace(id);
		
		if(rs==0) {
			model.addAttribute("error","Deleting place is failed");
			return "redirect:/";
		}
		
		return "redirect:/displayplace";
	}

	private String uploadImage( MultipartFile multipartFile, HttpServletRequest request) {
		String image = System.currentTimeMillis() + ".jpg" ;
        String rootDirectory = request.getSession().getServletContext().getRealPath("/");
        Path path = Paths.get(rootDirectory + "/WEB-INF/donateimages/" + image);
        if (multipartFile != null && !multipartFile.isEmpty()) {
            try {
            	multipartFile.transferTo(new File(path.toString()));
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return image ;
	}
	
	//fix category -> donateplace
	@RequestMapping(value="/category/{id}",method=RequestMethod.GET)
	public String donatePlaceForm(@PathVariable int id, ModelMap model) {
		ArrayList<DonateResponseDTO> dtoList=new ArrayList<DonateResponseDTO>();
		dtoList=donateDao.getPlaceByCatId(id);
		ArrayList<DonatePlace> placeList=new ArrayList<DonatePlace>();
		for(DonateResponseDTO dto:dtoList) {
			DonatePlace bean=new DonatePlace();
			bean.setId(dto.getId());
			bean.setName(dto.getName());
			bean.setImagePath(dto.getImagePath());
			bean.setDescription(dto.getDescription());
			bean.setCreateDate(dto.getCreateDate());
			bean.setDonatesector_id(dto.getDonatesector_id());
			bean.setDonatesector_name(dto.getDonatesector_name());
			placeList.add(bean);
			}
		
		model.addAttribute("placeList",placeList);
		
		
		ArrayList<SectorResponseDTO> sectorList=new ArrayList<SectorResponseDTO>();
		sectorList=sectorDao.getAllSectors();
		
		ArrayList<DonateSector> categories=new ArrayList<DonateSector>();
		for(SectorResponseDTO dto:sectorList) {
			DonateSector sector=new DonateSector();
			sector.setId(dto.getId());
			sector.setName(dto.getName());
			
			
			categories.add(sector);
			}
		
		model.addAttribute("categories",categories);
		
		
		return "donateplace";
	}
	
	@RequestMapping(value="/donateplace",method=RequestMethod.GET)
	public String donatePlace( ModelMap model) {
		ArrayList<DonateResponseDTO> dtoList=new ArrayList<DonateResponseDTO>();
		dtoList=donateDao.getAllPlaces();
		ArrayList<DonatePlace> placeList=new ArrayList<DonatePlace>();
		for(DonateResponseDTO dto:dtoList) {
			DonatePlace bean=new DonatePlace();
			bean.setId(dto.getId());
			bean.setName(dto.getName());
			bean.setImagePath(dto.getImagePath());
			bean.setDescription(dto.getDescription());
			bean.setCreateDate(dto.getCreateDate());
			bean.setDonatesector_id(dto.getDonatesector_id());
			bean.setDonatesector_name(dto.getDonatesector_name());
			placeList.add(bean);
			}
		
		model.addAttribute("placeList",placeList);
		
		
		ArrayList<SectorResponseDTO> sectorList=new ArrayList<SectorResponseDTO>();
		sectorList=sectorDao.getAllSectors();
		
		ArrayList<DonateSector> categories=new ArrayList<DonateSector>();
		for(SectorResponseDTO dto:sectorList) {
			DonateSector sector=new DonateSector();
			sector.setId(dto.getId());
			sector.setName(dto.getName());
			
			
			categories.add(sector);
			}
		
		model.addAttribute("categories",categories);
		
		
		return "donateplace";
	}
	
	private boolean isUserAuthenticated(HttpServletRequest request) {
        // Check if the "user" attribute is present in the session.
        UserResponseDTO user = (UserResponseDTO) request.getSession().getAttribute("admin");
        return user != null;
    }
}
