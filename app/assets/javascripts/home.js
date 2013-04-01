function highlightActiveTopic(id) 
{ 
	$("#listTopic .active").removeClass("active");
	$("#lt" + id).addClass("active");
}
