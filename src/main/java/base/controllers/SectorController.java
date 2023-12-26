package base.controllers;

import java.util.ArrayList;

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
import org.springframework.web.servlet.ModelAndView;

import base.daos.SectorDAO;
import base.models.DonateSector;
import base.dtos.*;
@Controller
public class SectorController {
	@Autowired 
	SectorDAO sectorDao;
	
	@RequestMapping(value="/displaySector",method=RequestMethod.GET)
	public String displaySector(ModelMap model,HttpServletRequest request) {
		
		if (!isUserAuthenticated(request)) {
            // User is not authenticated. Redirect to the login page.
            return "error";
        }
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
		return "displaySector";
		
	}
	
	@RequestMapping(value="/createSector",method=RequestMethod.GET)
	public ModelAndView createSectorForm() {
		return new ModelAndView("createSector","sector_info",new DonateSector());
	}
	
	@RequestMapping(value="/createSector", method=RequestMethod.POST)
	public String createSector(@ModelAttribute("sector_info") @Validated DonateSector sector,BindingResult bs,ModelMap model) {
		System.out.println("From jsp : " + sector.getName());
		if(bs.hasErrors()) {
			model.addAttribute("error","Creating Sector is failed");
			return "createSector";
		}
		
		SectorRequestDTO reqDto=new SectorRequestDTO();
		reqDto.setId(sector.getId());
		reqDto.setName(sector.getName());
		
		System.out.println(reqDto.getName());

		int rs=sectorDao.createDonateSector(reqDto);
		if(rs==0) {
			System.out.println("Nothing Here");
			return "createSector";
		}
		System.out.println("Save Successfully");
		return "redirect:/displaySector";
	}
	
	@RequestMapping(value="/updateSector/{id}",method=RequestMethod.GET)
	public ModelAndView updateSectorForm(@PathVariable int id) {
		SectorResponseDTO resDto=new SectorResponseDTO();
		resDto=sectorDao.getSectorById(id);
		DonateSector sector=new DonateSector();
		sector.setId(resDto.getId());
		sector.setName(resDto.getName());
		return new ModelAndView ("updateSector","sector_info", sector);
	}
	
	@RequestMapping(value="/updateSector", method=RequestMethod.POST)
	public String updateSector(@ModelAttribute("sector_info")@Validated DonateSector sector,BindingResult bs,ModelMap model) {
		if(bs.hasErrors()) {
			return "updateSector";
		}
		
		SectorRequestDTO reqDto=new SectorRequestDTO();
		reqDto.setId(sector.getId());
		reqDto.setName(sector.getName());
		int rs=sectorDao.updateDonateSector(reqDto);
		if (rs==0) {
			System.out.println("Nothing Here");
			return "updateSector";
		}
		
		return "redirect:/displaySector";
	}
	
	@RequestMapping(value="/deleteSector/{id}", method=RequestMethod.GET)
	public String deleteSector(@PathVariable int id) {
		int rs=sectorDao.deleteDonateSector(id);
		if (rs==0) {
			return "displaySector";
		}
		
		return "redirect:/displaySector";
	}
	
	private boolean isUserAuthenticated(HttpServletRequest request) {
        // Check if the "user" attribute is present in the session.
        UserResponseDTO user = (UserResponseDTO) request.getSession().getAttribute("admin");
        return user != null;
    }
}
	

