# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->

	update_price = ->
		voltage = $('#select_voltage').val()
		parsed_voltage = parseFloat(voltage).toFixed(2)
		$('#priceValue').text(parsed_voltage)

	update_price()

jQuery ->


	update_price = ->
		voltage = $('#select_voltage').val()
		parsed_voltage = parseFloat(voltage).toFixed(2)
		$('#priceValue').text(parsed_voltage)

	$('#select_voltage').change (event) ->
        update_price()