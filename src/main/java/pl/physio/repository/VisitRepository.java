package pl.physio.repository;

import java.sql.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import pl.physio.entity.Visit;

public interface VisitRepository extends JpaRepository<Visit, Long> {
	
	@Query("SELECT v FROM Visit v ORDER BY date asc, hour asc")
	List<Visit> customFindByDateAndTime();
	
	@Query("SELECT v FROM Visit v WHERE v.date >=:todayParam ORDER BY date asc, hour asc")
	List<Visit> customFindByDateAndTimeFuture(@Param("todayParam") Date todayParam);
	
	@Query("SELECT v FROM Visit v WHERE v.patient.id =:patientId AND v.date >=:todayParam ORDER BY v.date asc, v.hour asc ")
	List<Visit> customFindByPatientFuture(@Param("patientId") long patientId,
										  @Param("todayParam") Date todayParam);
	
	@Query("SELECT v FROM Visit v WHERE v.patient.id =:patientId AND v.date <:todayParam ORDER BY v.date desc, v.hour desc ")
	List<Visit> customFindByPatientPast(@Param("patientId") long patientId,
										  @Param("todayParam") Date todayParam);
	
	@Query("SELECT v FROM Visit v WHERE v.date >=:fromParam AND v.date <=:toParam ORDER BY v.date asc, v.hour asc")
	List<Visit> visitsFromTo(@Param("fromParam") Date fromParam,
							 @Param("toParam") Date toParam);

}
