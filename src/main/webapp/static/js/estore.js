$(document).ready(function(){
	$("[data-favorite]").click(function() {
		id = $(this).attr("data-favorite");
		$.ajax({
			url:"/prod/mark-item-favorite/" + id,
			success:function(response) {
				alert(response);
			}
		})
	});
	
	$("[data-item-send-to-friend]").click(function(){
		
	});
})