package pl.physio.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.physio.entity.Service;
import pl.physio.repository.ServiceRepository;

@Controller
@RequestMapping("/service")
public class ServiceController {
	
	@Autowired
	ServiceRepository serviceRepository;
	
	@RequestMapping("")
	public String showAll(Model model) {
		model.addAttribute("services", serviceRepository.findAll());
		return "service";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String addService(Model model) {
		Service service = new Service();
		model.addAttribute("service",service);
		return "add_service_form";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String addService(@Valid Service service, BindingResult result) {
		if(result.hasErrors()) {
			return "add_service_form";
		}
		serviceRepository.save(service);
		return "redirect:./";
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.GET)
	public String editService(Model model, @PathVariable long id) {
		model.addAttribute("service", serviceRepository.findOne(id));
		return "edit_service_form";
	}
	
	@RequestMapping(value="/edit/{id}", method=RequestMethod.POST)
	public String editService(@Valid Service service, BindingResult result) {
		if(result.hasErrors()) {
			return "edit_service_form"; 
		}
		serviceRepository.save(service);
		return "redirect:../";
	}
	
	
	
	
	
	

}
