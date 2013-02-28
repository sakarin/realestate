$ ->
  $("#comment_check_all").change ->
    if $(this).is(":checked")
      $(".comment_id_checkbox").attr "checked", "checked"
    else
      $(".comment_id_checkbox").removeAttr "checked"