package pl.physio.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import pl.physio.entity.Service;

public interface ServiceRepository extends JpaRepository<Service, Long> {

}
