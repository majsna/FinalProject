package pl.physio.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;

import pl.physio.entity.Patient;
import pl.physio.repository.PatientRepository;

@Controller
@RequestMapping("/patient")
public class PatientController {
	
	@Autowired
	PatientRepository patientRepository;
	
	@RequestMapping("/")
	@ResponseBody
	public List<Patient> getPatientList(){
		return patientRepository.findAll();
	}
	
	@RequestMapping("/view")
	public String mainView(Model model) {
		Patient patient = new Patient();
		model.addAttribute("patient", patient);
		return "patient";	
	}
	
	@RequestMapping(value =	"/add",	method = RequestMethod.POST)
	@ResponseBody
	public List<Patient> addPatient(@RequestBody String patient) {
		ObjectMapper mapper = new ObjectMapper();		
		try {
			Patient newPatient = mapper.readValue(patient, Patient.class);
			patientRepository.save(newPatient);
		} catch (IOException e) {
			e.printStackTrace();
		} 
			
		return patientRepository.findAll();
	}
	
	@RequestMapping("/{id}")
	@ResponseBody
	public Patient showDetails(@PathVariable long id){
		return patientRepository.findOne(id);		
	}
	
	@RequestMapping(value="/{id}", method = RequestMethod.DELETE)
	@ResponseBody
	public List<Patient> delPatient(@PathVariable long id){
		patientRepository.delete(id);
		return patientRepository.findAll();		
	}
	
	
	@RequestMapping(value="/{id}", method = RequestMethod.PUT)
	@ResponseBody
	public List<Patient> editPatient(@RequestBody String editedPatient) {
		ObjectMapper mapper = new ObjectMapper();		
		try {
			Patient newPatient = mapper.readValue(editedPatient, Patient.class);
			patientRepository.save(newPatient);
		} catch (IOException e) {
			e.printStackTrace();
		} 
		return patientRepository.findAll();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
