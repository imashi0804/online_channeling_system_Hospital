$(document).on("click", ".btnUpdate", function(event) { 
	
	$("#hidItemIDSave").val($(this).closest("tr").find('#hidItemIdUpdate').val());
	$("#hospitalName").val($(this).closest("tr").find('td:eq(1)').text());
	$("#hospitalAddress").val($(this).closest("tr").find('td:eq(2)').text());
	$("#phone").val($(this).closest("tr").find('td:eq(3)').text());
	$("#hospitalEmail").val($(this).closest("tr").find('td:eq(4)').text());
	$("#password").val($(this).closest("tr").find('td:eq(5)').text());

	
	$("#alertSuccess").text().trim() == "Data Retrived"

});



$(document).ready(function () {
	 document.forms['form'].reset();
	 
});

$(document).ready(function() { 

	if($("#alertSuccess").text().trim() == ""){
		$("#alertSuccess").hide();
	}
	$("#alertError").hide(); 
	
});

$(document).on("click", "#btnSave", function(event) { 
	
	$("#alertSuccess").text("");  
	$("#alertSuccess").hide();  
	$("#alertError").text(""); 
	$("#alertError").hide(); 
	
	var status = validateItemForm(); 
	
	if (status != true)  {  
		$("#alertError").text(status);  
		$("#alertError").show();  
		return; 	
		} 
	
	var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT"; 
	
	$.ajax( { 
		url : "hostpitalAPI", 
		type : type,  
		data : $("#detailform").serialize(),  
		dataType : "text",  
		complete : function(response, status) 
		{   
			onItemSaveComplete(response.responseText, status);  
		
		} 
	}); 
	
});

function onItemSaveComplete(response, status) {  
	console.log(response);
	var resultSet = JSON.parse(response); 
	 
	if (resultSet.status.trim() == "success") {  
		
		$("#alertSuccess").text("Successfully saved.");  $("#alertSuccess").show(); 
		 
		 $("#divItemsGrid").html(resultSet.data); 
	
	} else if (resultSet.status.trim() == "error") 
	
	{  
		$("#alertError").text(resultSet.data); 
		$("#alertError").show(); 
		
	}
	else if (status == "error") {
		
		$("#alertError").text("Error while saving.");  
		$("#alertError").show(); 
	}
	 else 
	 {  
		 $("#alertError").text("Unknown error while saving.."); 
		 $("#alertError").show(); 
	 }
	
	$("#hidItemIDSave").val(""); 
	$("#detailform")[0].reset(); 
}


$(document).on("click", ".btnRemove", function(event) { 
	
	console.log(event);
	$.ajax( { 
		url : "hostpitalAPI",   
		type : "DELETE",   
		data : "HospitalId=" + $(this).val(),   
		dataType : "text",   
		complete : function(response, status) 
		{   
			onItemDeleteComplete(response.responseText, status);  
		
		} 
	}); 
	
});

function onItemDeleteComplete(response, status) {  
	
	var resultSet = JSON.parse(response); 
	 
	if (resultSet.status.trim() == "success") {  
		
		$("#alertSuccess").text("Successfully deleted."); 
		$("#alertSuccess").show(); 
		 
		 $("#divItemsGrid").html(resultSet.data); 
	
	} else if (resultSet.status.trim() == "error") 
	
	{  
		$("#alertError").text(resultSet.data); 
		$("#alertError").show(); 
		
	}
	else if (status == "error") {
		
		$("#alertError").text("Error while deletingdeleting.");  
		$("#alertError").show(); 
	}
	 else 
	 {  
		 $("#alertError").text("Unknown error while deleting.."); 
		 $("#alertError").show(); 
	 }
	
}



	
	

function validateItemForm() {  
	
	if ($("#hospitalName").val().trim() == "") {  
		
		return "Please enter hospital name";
	} 
	
	if ($("#hospitalAddress").val().trim() == "") {  
		 
		return "Please Enter hospital addres";
	} 
	var phone =$("#phone").val().trim();
	if (phone == "") {  

	return "Please Enter valid phone number";
	} 
	
	if ($("#hospitalEmail").val().trim() == "") {  

		return "Please enter email";
	} 
	if ($("#password").val().trim() == "") {  

		return "Please Enter password";
	} 
	
	
	return true; 
	 
	}
