(function() {

  jQuery(function() {
    $("a[rel=popover]").popover();
    $(".tooltip").tooltip();
    $("a[rel=tooltip]").tooltip();
    return $('.dropdown-toggle').dropdown();
  });

}).call(this);
