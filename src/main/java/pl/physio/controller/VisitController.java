package pl.physio.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import pl.physio.entity.Patient;
import pl.physio.entity.Service;
import pl.physio.entity.Visit;
import pl.physio.repository.PatientRepository;
import pl.physio.repository.ServiceRepository;
import pl.physio.repository.VisitRepository;

@Controller
@RequestMapping("/calendar")
public class VisitController {
	
	@Autowired
	VisitRepository visitRepository;
	@Autowired
	PatientRepository patientRepository;
	@Autowired
	ServiceRepository serviceRepository;
	
	@ModelAttribute("patients")
	public List<Patient> getPatientsList(){
		return patientRepository.findAll();
	}
	
	@ModelAttribute("services")
	public List<Service> getServiceList(){
		return serviceRepository.findAll();
	}
	
	@RequestMapping("")
	public String viewVisits(Model model) {
		model.addAttribute("visits", visitRepository.findAll());
		return "calendar";		
	}
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String addVisitForm(Model model) {
		Visit visit = new Visit();
		model.addAttribute("visit",visit);
		return "add_visit_form";
	}
	
	@RequestMapping(value="/add", method=RequestMethod.POST)
	public String addVisit(@Valid Visit visit, BindingResult resutl) {
		if(resutl.hasErrors()) {
			return "add_visit_form";
		}
		visitRepository.save(visit);
		return "redirect:./";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
