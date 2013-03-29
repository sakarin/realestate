(function() {

  jQuery(function() {
    var _this = this;
    $('#new_image').fileupload({
      dataType: "script",
      add: function(e, data) {
        var file, types;
        types = /(\.|\/)(gif|jpe?g|png)$/i;
        file = data.files[0];
        if (types.test(file.type) || types.test(file.name)) {
          data.context = $(tmpl("template-upload", file));
          $('#new_image').append(data.context);
          return data.submit();
        } else {
          return alert("" + file.name + " is not a gif, jpeg, or png image file");
        }
      },
      progress: function(e, data) {
        return $("#spinner").show();
      },
      success: function(data, status) {
        $("#spinner").hide();
        return $("#calltouploadpic").hide();
      }
    });
    $('.best_in_place').best_in_place();
    $('#basic_step').bind('click', function(event) {
      sessionStorage.setItem('listing_step', 'summary');
      return $('#step_form').submit();
    });
    $('#detail_step').bind('click', function(event) {
      sessionStorage.setItem('listing_step', 'summary');
      return $('#step_form').submit();
    });
    $('#media_step').bind('click', function(event) {
      sessionStorage.setItem('listing_step', 'summary');
      return $('#step_form').submit();
    });
    $('#final_step').bind('click', function(event) {
      sessionStorage.setItem('listing_step', 'summary');
      return $('#step_form').submit();
    });
    $("#listing_province_id").change(function() {
      var data;
      $("#listing_district_id").empty();
      data = $("#listing_province_id").val();
      return $.ajax({
        type: "POST",
        url: "/dynamic_amphurs/" + data,
        data: data,
        success: function(response) {
          $("#listing_amphur_id").html;
          return updateMapCenter(district_lat, district_lng, 13);
        }
      });
    });
    $("#listing_amphur_id").change(function() {
      var data;
      data = $("#listing_amphur_id").val();
      return $.ajax({
        type: "POST",
        url: "/dynamic_districts/" + data,
        data: data,
        success: function(response) {
          return $("#listing_district_id").html;
        }
      });
    });
    $('#images').sortable({
      axis: 'xy',
      handle: '.handle',
      refreshPositions: true,
      opacity: 0.6,
      scroll: true,
      placeholder: 'sortable_placeholder',
      containment: 'parent',
      update: function() {
        return $.post($(this).data('update-url'), $(this).sortable('serialize'));
      }
    });
    $('#q_property_type_cont').change(function() {
      return $('#listing_search').submit();
    });
    $('#q_listing_title_th_cont').change(function() {
      return $('#listing_search').submit();
    });
    return $(".image").live("mouseover mouseout", function(event) {
      if (event.type === "mouseover") {
        return $(this).find("a:first").show();
      } else {
        return $(this).find("a:first").hide();
      }
    });
  });

}).call(this);
