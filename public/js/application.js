$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  //Get the context of the canvas element we want to select
  //Get context with jQuery - using jQuery's .get() method.
  if ($("myChart").length != 0) {
    console.log("this is running")
    var ctx = $("#myChart").get(0).getContext("2d");
    //This will get the first returned node in the jQuery collection.
    var data = {
      labels: ["building 1", "building 2"],
      datasets: [
        {
          fillColor:"rgba(220,220,220,0.5)",
          strokeColor : "rgba(220,220,220,1)",
          data : [65,59]
        }
      ]
    }
    new Chart(ctx).Bar(data,{});
  }
});
