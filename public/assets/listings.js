(function() {

  jQuery(function() {
    $("#q_province_id_eq").change(function() {
      var data;
      $("#q_amphur_id_eq").empty();
      data = $("#q_province_id_eq").val();
      return $.ajax({
        type: "POST",
        url: "/amphurs/" + data,
        data: data,
        success: function(response) {
          return $("#q_amphur_id_eq").html;
        }
      });
    });
    return $('#btn-search-submit').click(function() {
      return $('#listing_search').submit();
    });
  });

}).call(this);
