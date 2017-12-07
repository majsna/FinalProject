package pl.physio.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

@Entity
@Table(name="patient")
public class Patient {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private long id;
	
	@Size(min=2, max=20)
	private String firstname;
	
	@Size(min=2, max=30)
	private String lastname;
	
	private long phone;
		
	@Column(unique=true, length=30)
	@Email
	private String email;
		
	private long pesel;
		
	private String street;
	
	private String postcode;
	
	private String city;
	
	private String basicDiagnosis;
	
	@OneToMany(mappedBy="patient", cascade=CascadeType.ALL)
	private List<Visit> visits;

	public Patient(long id, String firstname, String lastname, String email, long pesel) {
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.pesel = pesel;
	}
	
	public Patient() {

	}
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	

	public long getPhone() {
		return phone;
	}

	public void setPhone(long phone) {
		this.phone = phone;
	}

	public long getPesel() {
		return pesel;
	}

	public void setPesel(long pesel) {
		this.pesel = pesel;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getBasicDiagnosis() {
		return basicDiagnosis;
	}

	public void setBasicDiagnosis(String basicDiagnosis) {
		this.basicDiagnosis = basicDiagnosis;
	}

//	public List<Visit> getVisits() {
//		return visits;
//	}
//
//	public void setVisits(List<Visit> visits) {
//		this.visits = visits;
//	}
	
	
	

	
	
	
	
	
	

}
