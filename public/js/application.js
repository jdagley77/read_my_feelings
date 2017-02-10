$(document).ready(function() {
  good_reads()
});

var good_reads = function() {
	$('#search').on("submit", function(e){
		e.preventDefault();
		var url = $(this).attr('action')
		var method = $(this).attr('method')
		var data = $(this).serialize();
		var $link = $(this)
		console.log(url, method)
		$.ajax({
			url: url,
			method: method,
			data: data
		})		
		.done(function(res){
			$link.append(res);
		})
	})

}


