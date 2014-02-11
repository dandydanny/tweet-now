$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $("form").submit(function(e) {
    e.preventDefault();
    $.post("/tweet", $("form").serialize(), function(data) {
      console.log(data);
      $("#all-good").toggle();
    })
  })


  // var request_data = {"username": window.location.pathname.substr(1)};
  // $.post("/tweets", request_data, function(data) {
  //     $(".tweets").html(data);
  // });


});

