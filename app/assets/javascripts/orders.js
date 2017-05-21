$(document).ready(function(){
  var total_price = $('tr.order-total .amount').html();
  
  $('select').on('change',function(){
    var value = $(this).val();
    // console.log(value);
    $.ajax({
         // data: value,
         url: "/deliveries/" + value,
         method: "GET",
         success: function(result){
              // console.log("Result is: " + result.price);
              $('tr.shipping td').html(result.price);
              recalculate_total(result.price);

         }
     }); 
  });  

  function recalculate_total(delivery_price){
    
    val_parsed = parseFloat(total_price);
    end_sum = delivery_price + val_parsed;
    $('tr.order-total .amount').html(end_sum);
  }
});
