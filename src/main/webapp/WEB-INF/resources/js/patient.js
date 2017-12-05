$(function(){
	
	var $patientList = $('ul.patientList');
	var $addPatientForm = $('#patientForm');
	console.log($addPatientForm);
    var $patientTemplate = $('#patientTemplate').html();
         
    function addPatient(patient){ 
       $patientList.append(Mustache.render($patientTemplate, patient));  	
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
        
        if($patientList.children().last().find('p').attr('data-id') == null){
            var newId = 1;
        }else{
        	var newId = parseInt( $patientList.children().last().find('p').attr('data-id') ) +1;
        }
        
        var patient = {
        		id: newId,
        		firstname: $addPatientForm.find('#firstname').val(),
        		lastname: $addPatientForm.find('#lastname').val(),
        		email: $addPatientForm.find('#email').val(),
        		phone: $addPatientForm.find('#phone').val(),
        		pesel: $addPatientForm.find('#pesel').val(),
        		street: $addPatientForm.find('#street').val(),
        		postcode: $addPatientForm.find('#postcode').val(),
        		city: $addPatientForm.find('#city').val()
        		
        }
        
        $.ajax({
        	url: '/PhysioApp/patient/add',
        	method: 'POST',
        	data: JSON.stringify(patient),
        	dataType: 'json',
        	contentType: 'application/json'
        })
        .done(function(response){
        	addPatient(patient);
        	console.log('patient added successfully');
        })
        .fail(function(response){
        	alert('error saving book');
        	console.log(response);
        })
        
    })
    
    //loading patient details by id
    
    $patientDetailsTmp = $('#patientDetailsTmp').html();
     
    function addPatientDetails(htmlElem, patient){
    	htmlElem.append(Mustache.render($patientDetailsTmp, patient)).hide().slideDown();
    }
    
    $patientList.delegate('button.showDetails','click', function(){
    	
    	var $div = $(this).next().next();
    	var self = $(this);
    	
    	$.ajax({
    		url: '/PhysioApp/patient/'+$(this).attr('data-id')
    	})
    	.done(function(patient){
    		
    		if( $div.children().length == 0 ){
    			addPatientDetails($div,patient);
			}else{
				if($div.css('display')=='none'){
					$div.css('display', 'block').hide().slideDown();
					self.text('Hide');
				}else {	
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
    var $editButton = $('button.editPatient');
    
    $patientList.on('click', 'button.editPatient', function(){
    	
    	if( $(this).closest('li').find('.editForm').css('display') == 'none'){
    		$(this).closest('li').find('.editForm').css('display', 'block').hide().slideDown();
    		$(this).text('Cancel');
    	}else {
    		$(this).closest('li').find('.editForm').css('display', 'none').show().slideUp();
    		$(this).text('Edit');
    	}
    	 
    })
    
    var $saveButton = $('button.savePatient');
    
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
        		city: $div.find('[name=city]').val()
    	}
    	
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
    		$div.css('display', 'none').show().slideUp(); 
    		$self.text('Edit');
    	})
    	.fail(function(response){
    		alert('error editing patient');
    		console.log(response);
    	})
    	
    })
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
});
