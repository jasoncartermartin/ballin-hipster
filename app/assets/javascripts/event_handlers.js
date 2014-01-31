$(document).ready(function() {
  $("#wiki_body").keyup(function (){
    $("#wiki_body_preview").text(function (){
      return $("#wiki_body").val();
    });
  });
});