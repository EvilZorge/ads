$(document).ready(function(){
    $('#tableTypes').dataTable({
      "columnDefs": [ { 
        "targets": -1, 
        "orderable": false 
      } ]
    });
});