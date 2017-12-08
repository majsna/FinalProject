/*jslint browser: true*/
/*global $, jQuery, alert*/

$(function(){
	
	var $patientList = $('ul.patientList');
	var $addPatientForm = $('#patientForm');
	console.log($addPatientForm);
    var $patientTemplate = $('#patientTemplate').html();
         
    function addPatient(patient){ 
       $patientList.append(Mustache.render($patientTemplate, patient)).fadeIn();  	
    }
       
    //loading patient from server
    
    $.ajax({
        url: '/PhysioApp/patient/',
        method: 'GET'
    })
    .done(function(patients){
        $.each(patients, function(i, patient){
            addPatient(patient);
        });
    })
    .fail(function(response){
        console.log(response);
    })
    
    
	//posting new patient to the server
	$addPatientForm.on('submit', function(){
        
        event.preventDefault();
        
        var patient = {
        		firstname: $addPatientForm.find('#firstname').val(),
        		lastname: $addPatientForm.find('#lastname').val(),
        		email: $addPatientForm.find('#email').val(),
        		phone: $addPatientForm.find('#phone').val(),
        		pesel: $addPatientForm.find('#pesel').val(),
        		street: $addPatientForm.find('#street').val(),
        		postcode: $addPatientForm.find('#postcode').val(),
        		city: $addPatientForm.find('#city').val(),
        		basicDiagnosis: $addPatientForm.find('#basicDiagnosis').val()
        		
        }
        
        if(patient.firstname != ""&&
           patient.lastname != "" &&
           patient.email != "" &&
           patient.phone != "" &&
           patient.pesel != "" &&
           patient.street != "" &&
           patient.postcode != "" &&
           patient.city != "" &&
           patient.basicDiagnosis != ""){
        	
        	  $.ajax({
              	url: '/PhysioApp/patient/add',
              	method: 'POST',
              	data: JSON.stringify(patient),
              	dataType: 'json',
              	contentType: 'application/json'
              })
              .done(function(responsePatient){            	
              	addPatient(responsePatient);
              	console.log(responsePatient);
              })
              .fail(function(response){
              	alert('Email must be well-formed and unique in our database!');
              	console.log(response);
              })
        	
        }else{
        	alert('All fields are mandatory!')
        }
        
      
        
    })
    
    //loading patient details by id
    
    $patientDetailsTmp = $('#patientDetailsTmp').html();
     
    function addPatientDetails(htmlElem, patient){
    	htmlElem.append(Mustache.render($patientDetailsTmp, patient)).hide().slideDown();
    }
    
    $patientList.delegate('button.showDetails','click', function(){
    	
    	var $div = $(this).next().next().next();
    	var self = $(this);
    	
    	$.ajax({
    		url: '/PhysioApp/patient/'+$(this).attr('data-id')
    	})
    	.done(function(patient){
    		
    		if( $div.children().length == 0 ){
    			addPatientDetails($div,patient);
    			self.text('Hide');
			}else{
				if($div.css('display')=='none'){
					$div.css('display', 'block').hide().slideDown();
					self.text('Hide');
				}else {
					if($div.next().css('display') != 'none') {
						$div.next().css('display', 'none').show().slideUp();						
					}
					$div.css('display', 'none').show().slideUp();
					self.text('Details');
				}
			}
    		
    		console.log('details added succesfully');
    	})
    	  	
    })
 
    //deleting patients
    $patientList.delegate('button.delPatient', 'click', function(){
    	
    	var $li = $(this).closest('li');
    	
    	$.ajax({
    		url: '/PhysioApp/patient/'+$(this).attr('data-id'),
    		method: 'DELETE'
    	})
    	.done(function(){
    		$li.fadeOut(300, function(){
				$(this).remove();
			});
    	})
    	
    })
    
    //editing patient
    
    $patientList.on('click', 'button.editPatient', function(){
    	
    	if( $(this).closest('li').find('.editForm').css('display') == 'none'){
    		$(this).closest('li').find('.editForm').css('display', 'block').hide().slideDown();
    		$(this).text('Cancel');
    	}else {
    		$(this).closest('li').find('.editForm').css('display', 'none').show().slideUp();
    		$(this).text('Edit');
    	}
    	 
    })
    
    
    $patientList.delegate('button.savePatient','click', function(){
    
    	var $div = $(this).closest('div');
    	var $deatailsList = $(this).closest('li').find('ul');
    	var $par = $(this).closest('li').find('p');
    	var $self = $(this);
    	
    	var editedPatient = {
    			id: $div.attr('data-id'),
    			firstname: $div.find('[name=firstname]').val(),
        		lastname: $div.find('[name=lastname]').val(),
        		email: $div.find('[name=email]').val(),
        		phone: $div.find('[name=phone]').val(),
        		pesel: $div.find('[name=pesel]').val(),
        		street: $div.find('[name=street]').val(),
        		postcode: $div.find('[name=postcode]').val(),
        		city: $div.find('[name=city]').val(),
        		basicDiagnosis: $div.find('[name=basicDiagnosis]').val()
    	}
    	
    	 if(editedPatient.firstname != ""&&
    	    editedPatient.lastname != "" &&
    	    editedPatient.email != "" &&
    	    editedPatient.phone != "" &&
    	    editedPatient.pesel != "" &&
    	    editedPatient.street != "" &&
    	    editedPatient.postcode != "" &&
    	    editedPatient.city != "" &&
    	    editedPatient.basicDiagnosis != ""){
    		 
    		 $.ajax({
    	    		url: '/PhysioApp/patient/'+$div.attr('data-id'),
    	    		method: 'PUT',
    				data: JSON.stringify(editedPatient),
    				dataType: 'json',
    				contentType: 'application/json'
    	    	})
    	    	.done(function(response){
    	    		console.log(response);
    	    		$self.closest('div').prev().empty();
    	    		addPatientDetails($self.closest('div').prev(), editedPatient);
    	    		$par.find('b').text($div.find('[name=firstname]').val()+" "+$div.find('[name=lastname]').val());
    	    		$div.css('display', 'none').show().slideUp(); 
    	    		$self.text('Edit');
    	    	})
    	    	.fail(function(response){
    	    		alert('error editing patient');
    	    		console.log(response);
    	    	})
    		 
    	 }else {
    		 alert("All fields are mandatory!")
    	 }
    	
    	
    	
    })
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
});
