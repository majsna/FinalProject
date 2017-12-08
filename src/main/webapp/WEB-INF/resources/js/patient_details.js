/*jslint browser: true*/
/*global $, jQuery, alert*/

$(function(){
	
	//adding diagnosis to the visit
	
    var $diagnosisTbl = $('table.diagnosisTbl');
    
    $diagnosisTbl.delegate('button.diagnosis', 'click', function(){
        
        var $div = $(this).closest('tr').find('div');
  
        if($div.css('display')=='none'){
            $div.css('display', 'block').hide().slideDown('slow');
        }else{
            $div.css('display', 'none').show().slideUp('slow');
        }
        
    })
    
    $diagnosisTbl.delegate('button.submitDiagnosis', 'click', function(){
        
        self = $(this);
        $divForm = $(this).closest('div');
        
        var visit = {
            id: $divForm.find('[name=id]').val(),
            date: $divForm.find('[name=date]').val(),
            diagnosis: $divForm.find('[name=diagnosis]').val(),
            hour: $divForm.find('[name=hour]').val(),
            patient: {
                        id: $divForm.find('[name=patient_id]').val()
                    },
            service: {
                        id: $divForm.find('[name=service_id]').val()   
                    }
        }
    
        
        if(visit.diagnosis != ''){
            
            $.ajax({
                url: '/PhysioApp/patient/details/'+self.attr('data-id'),
                method: 'POST',
                data: JSON.stringify(visit),
                dataType: 'json',
                contentType: 'application/json'
            })
            .done(function(response){
                console.log(response);
                self.closest('td').find('span.diagnosis').text($divForm.find('[name=diagnosis]').val());
                $divForm.css('display','none').show().slideUp('slow');
                
            })
            .fail(function(response){
                console.log(response);
                alert('Error while adding diagnosis/description.');
            })
            
        }else{
        	alert('The field cannot be blank.');
        }
        
    })
	
	
})