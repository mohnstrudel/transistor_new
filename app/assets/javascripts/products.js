$(document).ready(function() {
  var update_price;
  update_price = function() {
    var parsed_size, size;
    size = $('#select_size').val();

    // Same, as above, we need to parse
    size_array = size.split(",")[1].replace(']','');
    parsed_size = parseFloat(size_array).toFixed(2);
    
    return $('#priceValue').text(parsed_size);
  };
  return update_price();

});

jQuery(function() {
  var update_price;
  update_price = function() {
    var parsed_size, size;
    size = $('#select_size').val();

    // size is of type [7, 12.0], we need to parse it first
    // into id and value (basically we need the last value)
    size_array = size.split(",")[1].replace(']','');
    parsed_size = parseFloat(size_array).toFixed(2);
    console.log(size_array);
    return $('#priceValue').text(parsed_size);
  };
  return $('#select_size').change(function(event) {
    return update_price();
  });
});