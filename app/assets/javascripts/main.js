
  $(document).ready(function(){
    $(document).ready(function(){
      $('.datepicker').datepicker({
        format: 'dd/mm/yyyy' 
      });
    });
    $('input[class="daterange"]').daterangepicker({
      locale: { format: 'DD/MM/YYYY' }
    });
  })
