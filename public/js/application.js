$(document).ready(function() {
  good_reads()
});

var good_reads = function() {
	$('#search').on("submit", function(e){
		e.preventDefault();
		var url = $(this).attr('action')
		var method = $(this).attr('method')
		console.log(url, method)
		$.ajax({
			url: url,
			method: method
		})		
		.done(function(res){
			console.log("done")
		})
	})

}


// $(document).ready(function() {
//   giphy();
// });

// var giphy = function() {
//   $(".todo-item").on("click", function(event) {
//     event.preventDefault();
//   $.ajax({
//     url: "http://api.giphy.com/v1/gifs/search?q=motivational&api_key=dc6zaTOxFJmzC",
//     method: "GET"
//   })
//   .done(function(result){
//     console.log(("done"))
//     console.log(result);
//     var index = Math.floor(Math.random() * (10));
//     console.log(index);
//     var url = result["data"][index].embed_url;
//     // var url = "http://giphy.com/embed/l3fQsAQUKggBos9IQ"
//     $("#gif-div").html("<iframe src=\""+url+"\" width=\"480\"height=\"480\"frameborder=\"0\"></iframe>");
//   });
//   })

// }