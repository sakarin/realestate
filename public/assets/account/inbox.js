(function() {

  $(function() {
    return $("#comment_check_all").change(function() {
      if ($(this).is(":checked")) {
        return $(".comment_id_checkbox").attr("checked", "checked");
      } else {
        return $(".comment_id_checkbox").removeAttr("checked");
      }
    });
  });

}).call(this);
