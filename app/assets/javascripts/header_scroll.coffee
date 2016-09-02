headerScrollFunction = () ->
  $(window).on 'scroll', () ->
    if $(window).scrollTop() > 200
      $('#header .navbar-default').addClass('black')
    else
      $('#header .navbar-default').removeClass('black')

$(document).on 'turbolinks:load', headerScrollFunction
