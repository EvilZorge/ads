$(document).ready(function(){
    $('#myTable').dataTable({
      "order": [4,'desc'],
      "columnDefs": [ {
        "targets": -1,
        "orderable": false
      } ]
    });
});
