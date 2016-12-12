$(document).ready(function() {
  var arr = Array.new;
  var choices = [];

  // Sets the secret code
  $(".start").on('click', function(){
    if (sessionStorage['secretcode'] === undefined){
      $.ajax({
        url: "/secretcode",
        success: function(result){
          sessionStorage['secretcode'] = JSON.parse(result);
        }
      });
    };
    window.location.replace("/gameboard");
  });

  // Submits the guess to server
  $("#form1").submit(function(e) {
    var obj2 = [];
    e.preventDefault();
    var obj2=document.getElementsByClassName("source");
    for (var i=0; i<obj2.length; i++){
      if (obj2[i].checked){
        choices.push(obj2[i].value);
      }
    }
  });

  $( "[type=checkbox]").on('click', function(event){ 
    var clickedBox = event.target.id;
    console.log('x1');
    if ($('#' + clickedBox).is(':checked')) {
      console.log('x2');
      var circleColor = clickedBox;
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
      var j = ($("#circle").children().length) + 1;
      console.log(j);
      var html = "<span class='here" + j + "'></span>";
      console.log(html);
      $('#circle').append(html);
      $('.here' + j).css(styles);
      console.log('x3');
      function unCheck(){
        $('#' + clickedBox).prop('checked', false);
      }
      window.setTimeout(unCheck, 500);
      console.log('x4');
    }
  });


    // var styles= {};
    // for (var j=0; j<choices.length; j++) {
    //   var circleColor = choices[j];
    //   styles = {
    //     'display': 'inline-block',
    //     'width': 25 + 'px',
    //     'height': 25 + 'px',
    //     'background-color': circleColor,
    //     'border-radius': 10 + 'px'
    //   };
    //   if (circleColor === 'white'){
    //     styles['border']= 'black solid 1px';
    //   };
    //   var html = "<span class='here" + j + "'></span>";
    //   $('#circle').append(html);
    //   $('.here' + j).css(styles);
    // }          

});