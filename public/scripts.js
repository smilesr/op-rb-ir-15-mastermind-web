$(document).ready(function() {
  var arr = Array.new;
  var choices = [];
  $("#form1").submit(function(e) {
    var obj2 = [];

    e.preventDefault();
    // $.ajax({
    //   url: "../application_controller.rb",
    //   data: choices,
    //   success: function(result){
    //     var parsedResult = JSON.parse(result);
    //     var myBio = "His name is " + parsedResult.name + ". He is " + parse$
    //     $("#div1").html(myBio);
    // }});



  var obj2=document.getElementsByClassName("source");
  for (var i=0; i<obj2.length; i++){
    if (obj2[i].checked){
      choices.push(obj2[i].value);
    }
  }

  var styles= {};
  for (var j=0; j<choices.length; j++) {
    var circleColor = choices[j];
    styles = {
      'display': 'inline-block',
    'width': 25 + 'px',
    'height': 25 + 'px',
    'background-color': circleColor,
    'border-radius': 10 + 'px'
    };
    if (circleColor === 'white'){
      styles['border']= 'black solid 1px';
    };
    console.log(j);
    var html = "<span class='here" + j + "'></span>";
    $('#circle').append(html);
    $(".here" + j).css(styles);
  }          
  });
});