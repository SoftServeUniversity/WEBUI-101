(function() {
  $(function() {
    $('[data-behaviour~=datepicker]').datepicker({});
    $('#exhibition_exhibit_ids').removeClass('form-control');
    return $('#exhibition_exhibit_ids').select2({
      width: '300',
      placeholder: 'Choose exhibit',
      allowClear: true
    });
  });

}).call(this);
