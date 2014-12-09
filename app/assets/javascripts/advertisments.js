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

  // $("#autocomplete").focus(function() {
  //   $(".complete").show();
  // });

  // $("#autocomplete").blur(function() {
  //   $(".complete").hide();
  // });

  $("#country-select").on('change', function() {
    var search = $("#country-select").val();
    $.ajax({
      url: '/advertisments/cities_for_select',
      type: 'get',
      data: {search: search},
      success: function(ads) {
        $("#city-select").prop("disabled",false);
        $("#city-select").html("");
        for (var i in ads.data) {
          $("#city-select").append(new Option(ads.data[i].name, ads.data[i].id));
        }
      },
      error: function(xhr, status, error) {
        alert(xhr, status, error);
      },
    });
  });

  $("#make-select").on('change', function() {
    var search = $("#make-select").val();
    $.ajax({
      url: '/advertisments/models_for_select',
      type: 'get',
      data: {search: search},
      success: function(ads) {
        $("#model-select").prop("disabled",false);
        $("#model-select").html("");
        for (var i in ads.data) {
          $("#model-select").append(new Option(ads.data[i].name, ads.data[i].id));
        }    
      },
      error: function(xhr, status, error) {
        alert(xhr, status, error);
      },
    });
  });
});

