function doLike(pid,uid){
	const d={
		uid:uid,
		pid:pid,
		operation:'Like'
	}
	$.ajax({
		url:"LikeServlet",
		data:d,
		success:function(data,textStatus,jqXHR){
			if(data.trim()=="true"){
				let c=$(".like-counter").html();
				c++;
				$(".like-counter").html(c);
				
			}
			
		},
		error:function(jqXHR,textStatus,errorThrown){
			
		},
		
	});
}
