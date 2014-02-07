$(document).ready(function() {

  // card = new Skeuocard($("#skeuocard"), {
  //   numberInputSelector: '[name="card_number"]',
  //   expMonthInputSelector: '[name="card_month"]',
  //   expYearInputSelector: '[name="card_year"]',
  //   numberInputSelector: '[name="cc_number"]',
  //   cvcInputSelector: '[name="cc_cvc"]',
  //   typeInputSelector: '[name="cc_type"]',
  //   nameInputSelector: '[name="cc_name"]'
  // });
  if( $("#skeuocard").length)
    card = new Skeuocard($("#skeuocard"));
});