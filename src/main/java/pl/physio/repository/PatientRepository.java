package pl.physio.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.physio.entity.Patient;

public interface PatientRepository extends JpaRepository<Patient, Long> {
	
	

}
