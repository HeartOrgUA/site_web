$(function(){

  // Noty defaults
  $.noty.defaults.timeout = 4500;
  $.noty.defaults.layout = 'topRight';
  $.noty.defaults.animation = {
    open: 'animated bounceInRight',
    close: 'animated bounceOutRight'
  };

  // Select2 INIT
  $('.select2-with-tags').select2({
    tags: true
  });

  // Add/remove characteristic
  $('body').on('click', '.add-characteristic', function() {
    $(this).before('<div><input type="text" name="aed_model[characteristics][]" \
      id="aed_model_characteristics_" value="" style="width: 90%; display: inline-block; margin-bottom: 10px;">\
      <span class="fa fa-minus remove-characteristic"></span></div>')
  });

  $('body').on('click', '.remove-characteristic', function() {
    $(this).parent('div').remove();
  });

});
