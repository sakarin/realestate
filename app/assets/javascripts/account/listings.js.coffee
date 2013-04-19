# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('#new_image').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(gif|jpe?g|png)$/i
      file = data.files[0]
      if types.test(file.type) || types.test(file.name)
        data.context = $(tmpl("template-upload", file))
        $('#new_image').append(data.context)
        data.submit()
      else
        alert("#{file.name} is not a gif, jpeg, or png image file")
    progress: (e, data) ->
      $("#spinner").show()
    success: (data, status) =>
      $("#spinner").hide()
      $("#calltouploadpic").hide()


  $('.best_in_place').best_in_place()


  $('#basic_step').bind 'click', (event) =>
    sessionStorage.setItem('listing_step', 'summary')
    $('#step_form').submit()

  $('#detail_step').bind 'click', (event) =>
    sessionStorage.setItem('listing_step', 'summary')
    $('#step_form').submit()

  $('#media_step').bind 'click', (event) =>
    sessionStorage.setItem('listing_step', 'summary')
    $('#step_form').submit()

  $('#final_step').bind 'click', (event) =>
    sessionStorage.setItem('listing_step', 'summary')
    $('#step_form').submit()

  $("#listing_province_id").change ->
    $("#listing_district_id").empty()
    data = $("#listing_province_id").val()
    $.ajax
      type: "POST"
      url: "/dynamic_amphurs/" + data
      data: data
      success: (response) ->
        $("#listing_amphur_id").html
        updateMapCenter(district_lat, district_lng, 13)


  $("#listing_amphur_id").change ->
    data = $("#listing_amphur_id").val()
    $.ajax
      type: "POST"
      url: "/dynamic_districts/" + data
      data: data
      success: (response) ->
        $("#listing_district_id").html

  $('#images').sortable
    axis: 'xy'
    handle: '.handle'
    refreshPositions: true
    opacity: 0.6
    scroll:true

    placeholder: 'sortable_placeholder'
    containment: 'parent'
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))

  $('#q_property_type_cont').change ->
    $('#listing_search').submit()

  $('#q_listing_title_th_cont').change ->
    $('#listing_search').submit()


  $(".image").bind "mouseover mouseout", (event) ->
    if event.type is "mouseover"
      $(this).find("a:first").show()
    else
      $(this).find("a:first").hide()




  $("#listings-index-tab-link1").bind 'click', (event) =>
    window.location.href  = "/account/listings?q%5Bstate_cont%5D=show"

  $("#listings-index-tab-link2").bind 'click', (event) =>
    window.location.href = "/account/listings?q%5Bstate_cont%5D=draft"

  $("#listings-index-tab-link3").bind 'click', (event) =>
    window.location.href = "/account/listings?q%5Bstate_cont%5D=hidden"

  $("#listings-index-tab-link4").bind 'click', (event) =>
    window.location.href = "/account/listings?q%5Bstate_cont%5D=exclusive"








