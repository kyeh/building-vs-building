$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  //Get the context of the canvas element we want to select
  //Get context with jQuery - using jQuery's .get() method.
  console.log('chart elements: ' + $("myChart").length)
  if ($("#myChart").length != 0) {
    console.log("this is running")
    var ctx = $("#myChart").get(0).getContext("2d");
    // debugger
    //This will get the first returned node in the jQuery collection.
    var building1 = new Array
    var building2 = new Array
    building1["name"] = $('#building1-name').attr("value");
    building1["height"] = parseInt($('#building1-height').attr("value"));
    building2["name"] = $('#building2-name').attr("value");
    building2["height"] = parseInt($('#building2-height').attr("value"));

    var maxHeight = building1["height"]

    if(building1["height"] < building2["height"]) {
      maxHeight = building2["height"];
    }

    var data = {
      labels: [building1["height"], building2["height"]],
      datasets: [
        {
          fillColor:"rgba(151,187,205,0.5)",
          strokeColor : "rgba(151,187,205,1)",
          data : [building1["height"],building2["height"]]
        }
      ]
    }

    var options = {
      //Boolean - If we want to override with a hard coded scale
      scaleOverride : true,

      //** Required if scaleOverride is true **
      //Number - The number of steps in a hard coded scale
      scaleSteps : round(((maxHeight-700)/100 ))+1,
      //Number - The value jump in the hard coded scale
      scaleStepWidth : 100,
      //Number - The scale starting value
      scaleStartValue : 700,

      //Number - Spacing between each of the X value sets
      barValueSpacing : 40

    }
    new Chart(ctx).Bar(data,options);
  }

});

function round(num) {

 if(num%1 >= .5)
  return num-num%1+1;
 else
  return num-num%1;
}