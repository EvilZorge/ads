$(document).ready(function(){
    $('#tableUsers').dataTable({
      "columnDefs": [ { 
        "targets": -1, 
        "orderable": false 
      } ]
    });
});
