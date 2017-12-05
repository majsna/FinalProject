package pl.physio.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="patient")
public class Patient {
	
	@Id
	private long id;
	
//	@Size(min=2, max=20)
	private String firstname;
	
//	@Size(min=2, max=30)
	private String lastname;
	
	private long phone;
	
//	@NotBlank
	@Column(unique=true, length=30)
//	@Email
	private String email;
	
//	@PESEL
	private long pesel;
	
	private String street;
	
	private String postcode;
	
	private String city;
	
	@OneToMany(mappedBy="patient", cascade=CascadeType.ALL)
	private List<Visit> visits;
	
			
	public long getId() {
		return id;
	}

	public Patient(long id, String firstname, String lastname, String email, long pesel) {
		this.id = id;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.pesel = pesel;
	}
	
	public Patient() {

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
	
	
	

	
	
	
	
	
	

}
