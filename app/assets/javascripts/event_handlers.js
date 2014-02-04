$(document).ready(function() {
  $("#wiki_body").bind('input propertychange', function (){
    $("#wiki_body_preview").text(function (){
      return $("#wiki_body").val();
    });
  });
});