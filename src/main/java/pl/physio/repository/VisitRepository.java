package pl.physio.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.physio.entity.Visit;

public interface VisitRepository extends JpaRepository<Visit, Long> {
	
	
	List<Visit> findAllOrdereByDateAscTimeAsc();

}
