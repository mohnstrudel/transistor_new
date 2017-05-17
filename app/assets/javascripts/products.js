$(document).ready(function(){
  if($("body").hasClass("products show")){
    var update_price = function() {
      var parsed_size, size;
      size = $('#select_size').val();

      // Same, as above, we need to parse
      size_array = size.split(",")[1].replace(']','');
      parsed_size = parseFloat(size_array).toFixed(2);
      
      return $('#priceValue').text(parsed_size);
    }
    
    $('#select_size').change(function(event) {
      update_price();
    });

    // $('#add_to_cart').on('click', function(event){
    //   $(this).val("Добавлено").addClass('btn-dark').prop('disabled', true);;
    //   setTimeout(function(){
    //                 $("#add_to_cart").val("В корзину").removeClass('btn-dark').prop('disabled', false);
    //               }, 1500);

    // });
  }  
});
