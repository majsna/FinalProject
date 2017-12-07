package pl.physio.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import pl.physio.entity.Patient;
import pl.physio.entity.Visit;
import pl.physio.repository.PatientRepository;
import pl.physio.repository.VisitRepository;

@Controller
@RequestMapping("/patient")
public class PatientController {
	
	@Autowired
	PatientRepository patientRepository;
	@Autowired
	VisitRepository visitRepository;
	
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
	public Patient addPatient(@RequestBody String patient, Model model) {
		ObjectMapper mapper = new ObjectMapper();		
		try {
			Patient newPatient = mapper.readValue(patient, Patient.class);
			
			List<Patient> patients = patientRepository.findAll();
			for(Patient p : patients) {
				if( p.getEmail().equals(newPatient.getEmail()) ) {
					model.addAttribute("alert", "Given email is already taken.");
					return null;
				}
			}
			
			patientRepository.save(newPatient);
			return newPatient;
		} catch (IOException e) {
			e.printStackTrace();
		} 		
		return null;
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
	
	@RequestMapping("/details/{id}")
	public String details(Model model, @PathVariable long id) {
		model.addAttribute("patient", patientRepository.findOne(id));
		Date date = new Date((new java.util.Date()).getTime());
		model.addAttribute("visits", visitRepository.customFindByPatientFuture(id, date) );
		model.addAttribute("visitsPast", visitRepository.customFindByPatientPast(id, date));
		return "patient_details";
	}
	
	@RequestMapping(value="/details/{idv}",method=RequestMethod.POST)
	@ResponseBody
	public Visit editVisit(@RequestBody String visit) {
		ObjectMapper mapper = new ObjectMapper();		
		try {
			Visit editedVisit = mapper.readValue(visit, Visit.class);
			visitRepository.save(editedVisit);	
			return editedVisit;
		} catch (JsonParseException e) {
			e.printStackTrace();
		} catch (JsonMappingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		return null;
	}
	
	
	
	
	
	
	
	

}
