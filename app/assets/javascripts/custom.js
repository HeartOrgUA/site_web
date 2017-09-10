document.addEventListener('page:change', function() {
  //document.getElementById('main-content').className += 'animated fadeIn';
});
document.addEventListener('page:fetch', function() {
  //document.getElementById('main-content').className += 'animated fadeOut';
});

$(document).on('turbolinks:load', function() {
  $(window).trigger('scroll');

  makeProfileEditable();
  makeProfileViewable();
  getGoogleGeo();
  initJustifiedGallery();
  checkboxFilterStatusChange();

  $('.imt-form input[type="submit"]').click(calculateImt);

  // Set map height
  setMapHeight();
  $(window).on('resize, scroll', function(){
    setMapHeight();
  });
});

$(function(){

  //Set dynamic height
  var dynamic = $('.dynamic');
  dynamic.css( "height", "-="+dynamic.data('height') );
  window.onresize = function() {
    dynamic.css( "height", "auto" );
    dynamic.css( "height", "-="+dynamic.data('height') );
  };

  // Noty defaults
  $.noty.defaults.timeout = 4500;
  $.noty.defaults.layout = 'topRight';
  $.noty.defaults.animation = {
    open: 'animated bounceInRight',
    close: 'animated bounceOutRight'
  };

  $(window).on('scroll', function() {
    var container = $('.profile-menu-container');
    if ($(window).scrollTop() >= 50) {
      container.addClass('fixed').removeClass('abs');
    } else {
      container.addClass('abs').removeClass('fixed');
    }
  });
  $(window).trigger('scroll');

  // Make profile editable
  makeProfileEditable();

  getGoogleGeo();

  initJustifiedGallery();

  checkboxFilterStatusChange();

});

var calculateImt = function() {
  var mass = parseInt($('#mass').val());
  var height = parseInt($('#height').val());
  var result = Math.round(mass / Math.pow((height/100), 2));
  if (result < 19) {
    $('.imt-result').html('<b>У Вас недостатня маса</b><br>Ймовірність розвитку<br>\
      <ul><li>Серцево-судинних захворювань: <i>Низька</i></li>\
      <li>Бронхо-легеневих захворювань: <i>Збільшена</i></li>\
      <li>Ендокринних захворювань: <i>Низька</i></li>\
      </ul>');
  } else if (result < 25) {
    $('.imt-result').html('<b>У Вас нормальна маса</b><br>Ймовірність розвитку<br>\
      <ul><li>Серцево-судинних захворювань: <i>Низька</i></li>\
      <li>Бронхо-легеневих захворювань: <i>Низька</i></li>\
      <li>Ендокринних захворювань: <i>Низька</i></li>\
      </ul>');
  } else if (result < 30) {
    $('.imt-result').html('<b>У Вас передожиріння (гладкість)</b><br>Ймовірність розвитку<br>\
      <ul><li>Серцево-судинних захворювань: <i>Середня</i></li>\
      <li>Бронхо-легеневих захворювань: <i>Низька</i></li>\
      <li>Ендокринних захворювань: <i>Низька</i></li>\
      </ul>');
  } else if (result < 35) {
    $('.imt-result').html('<b>У Вас ожиріння I ступеня</b><br>Ймовірність розвитку<br>\
      <ul><li>Серцево-судинних захворювань: <i>Збільшена</i></li>\
      <li>Бронхо-легеневих захворювань: <i>Низька</i></li>\
      <li>Ендокринних захворювань: <i>Середня</i></li>\
      </ul>');
  } else if (result < 40) {
    $('.imt-result').html('<b>У Вас ожиріння II ступеня</b><br>Ймовірність розвитку<br>\
      <ul><li>Серцево-судинних захворювань: <i>Значно збільшена</i></li>\
      <li>Бронхо-легеневих захворювань: <i>Можливо, збільшена</i></li>\
      <li>Ендокринних захворювань: <i>Збільшена</i></li>\
      </ul>');
  } else if (result >= 40) {
    $('.imt-result').html('<b>У Вас ожиріння III ступеня</b><br>Ймовірність розвитку<br>\
      <ul><li>Серцево-судинних захворювань: <i>Істотно збільшена</i></li>\
      <li>Бронхо-легеневих захворювань: <i>Збільшена</i></li>\
      <li>Ендокринних захворювань: <i>Значно або істотно збільшена</i></li>\
      </ul>');
  } else {
    $('.imt-result').html('Неверные масса и/либо высота тела')
  }

}

var makeProfileEditable = function() {
  $('.change_profile').click(function() {
    $('.viewable').hide();
    $('.editable').show();
    $(this).hide();
  });
}

var makeProfileViewable = function() {
  $('.change_profile_cancel').click(function(e) {
    $('.viewable').show();
    $('.editable').hide();
    $('.change_profile').show();
    e.preventDefault();
    return false;
  });
}

var getGoogleGeo = function() {
  // Google GEO
  $('body').on('click', '.get-coords', function() {
    var params = 'Украина, '+$('#aed_city').val()+', '+$('#aed_address').val();
    var w;
    $.ajax({
      url: "https://maps.googleapis.com/maps/api/geocode/json?address="+params,
      success: function(a) {
        if (a.status === 'OK') {
          $('#aed_lonlat').addClass('success_geo');
          $('#aed_lonlat').val(a.results[0].geometry.location.lat + ' ' + a.results[0].geometry.location.lng);
          setTimeout(function() {
            $('#aed_lonlat').removeClass('success_geo');
          }, 1500);
        } else {
          $('#aed_lonlat').addClass('invalid_geo');
          $('#aed_lonlat').val('');
          setTimeout(function() {
            $('#aed_lonlat').removeClass('invalid_geo');
          }, 1500);
        }
      }
    });
  });
}

function setMapHeight() {
  var header_height = $('#header-collapse').outerHeight() || 0;
  var footer_height = $("footer").outerHeight() || 0;
  var filter_height = $('#filters').outerHeight() || 0;
  var doc_height = $(document).height();
  var map_wrapper = $('.aed-map');
  var scroll_top = $('body').scrollTop();
  var height = $(window).height();
  var upperSectionHeight = 50;

  if ($('.aed-obj-wrapper').height() > $(window).height()) {
    if (scroll_top > 2 * header_height + filter_height + upperSectionHeight) {
      map_wrapper.addClass('fixed');
      if (scroll_top > doc_height - $(window).height() - footer_height) {
        height = doc_height - scroll_top - footer_height;
      } else {
        height = $(window).height();
      }
    } else {
      height = $(window).height();
      map_wrapper.removeClass('fixed');
    }
  }
  map_wrapper.height(height);
}

var initJustifiedGallery = function() {
  $('.gallery').justifiedGallery({
    rowHeight: 300,
    captions: false,
    lastRow: 'justify',
    maxRowHeight: 300
  });
}

var checkboxFilterStatusChange = function() {
  var checkboxes = $('#checkbox-filters input[type="checkbox"]');
  checkboxes.change(function() {
    $(this).parents('form').submit();
  });

  $('.filter-reseter').click(function() {
    checkboxes.prop("checked", false);
    checkboxes.trigger('change');
  })
}
