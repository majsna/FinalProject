package pl.physio.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import pl.physio.entity.Patient;
import pl.physio.repository.PatientRepository;

public class PatientConverter implements Converter<String, Patient> {
	
	@Autowired
	private PatientRepository patientRepository;
	
	@Override
	public Patient convert(String source) {
		Patient patient = patientRepository.findOne(Long.parseLong(source));
		return patient;
	}

}
