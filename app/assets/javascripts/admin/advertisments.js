$(document).ready(function(){
    $('#tableModeration').dataTable({
      "order": [5,'desc'],
      "columnDefs": [ {
        "targets": [0,-1],
        "orderable": false
      } ]
    });

    $('#tableModeration').find(':checkbox').click(function() {
      if ($('#tableModeration').find(':checkbox').is(":checked")) {
        $('#btn_moder').prop('disabled',false);
      }
      else {
        $('#btn_moder').prop('disabled',true);
      }
    });
});

