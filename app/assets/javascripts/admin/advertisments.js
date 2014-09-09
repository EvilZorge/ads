$(document).ready(function(){
    $('#tableModeration').dataTable({
      "order": [5,'desc'],
      "columnDefs": [ { 
        "targets": [0,-1], 
        "orderable": false 
      } ]
    });
});
