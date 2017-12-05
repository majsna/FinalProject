package pl.physio.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;

import pl.physio.entity.Service;
import pl.physio.repository.ServiceRepository;

public class ServiceConverter implements Converter<String, Service> {
	
	@Autowired
	private ServiceRepository serviceRepository;
	
	@Override
	public Service convert(String source) {
		Service service = serviceRepository.findOne(Long.parseLong(source));
		return service;
	}
	
	
	
}
