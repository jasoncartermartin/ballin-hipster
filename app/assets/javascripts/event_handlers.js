/*
$("#wiki_body").keyup(function (){
  $("#wiki_body_preview").text(function (){
    $("#wiki_body").attr('data-value', wiki_body.value);
    return $("#wiki_body").data("value");
    });
  $("#wiki_body").text(function() {
    return $("#wiki_body").data("value");
  });
  alert( $("#wiki_body").text() );
});
*/
$("#wiki_body").keyup(function (){
  $("#wiki_body_preview").text(function (){
    return $("#wiki_body").val();
    });
  //alert( $("#wiki_body").val() );
});