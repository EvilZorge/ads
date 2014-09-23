$(document).ready(function(){
  $('#myTable').dataTable({
    "order": [4,'desc'],
    "columnDefs": [ {
      "targets": -1,
      "orderable": false
    } ]
  });

  $("#autocomplete").on("input", function() {
    var search = $("#autocomplete").val();
    $.ajax({
      url: '/advertisments/autocomplete',
      type: 'get',
      data: {search: search},
      success: function(ads) {
        $(".complete").html('');
        if (!ads.data.length==0 && search.length>1) {
          $(".complete").html(JST['views/index'](ads));
        };
      },
    });
  });

  $("#autocomplete").focus(function() {
    $(".complete").show();
  });

  $("#autocomplete").blur(function() {
    $(".complete").hide();
  });
});

