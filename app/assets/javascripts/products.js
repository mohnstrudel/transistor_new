$(document).ready(function() {
  var update_price;
  update_price = function() {
    var parsed_voltage, voltage;
    voltage = $('#select_voltage').val();
    parsed_voltage = parseFloat(voltage).toFixed(2);
    return $('#priceValue').text(parsed_voltage);
  };
  return update_price();

});

jQuery(function() {
  var update_price;
  update_price = function() {
    var parsed_voltage, voltage;
    voltage = $('#select_voltage').val();
    parsed_voltage = parseFloat(voltage).toFixed(2);
    return $('#priceValue').text(parsed_voltage);
  };
  return $('#select_voltage').change(function(event) {
    return update_price();
  });
});