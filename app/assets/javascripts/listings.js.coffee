# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $("#q_province_id_eq").change ->
    $("#q_amphur_id_eq").empty()
    data = $("#q_province_id_eq").val()
    $.ajax
      type: "POST"
      url: "/amphurs/" + data
      data: data
      success: (response) ->
#        alert(response)
        $("#q_amphur_id_eq").html

  $('#btn-search-submit').click ->
    $('#listing_search').submit()