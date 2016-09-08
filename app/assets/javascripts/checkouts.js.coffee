setupBraintree = () ->
  unless typeof gon is 'undefined'

    unless $("#dropin").length == 0
      braintree.setup(gon.client_token, 'dropin',
        {
          container: 'dropin',
          });

removeDropIn = () ->
  $("#dropin").remove()

$(document).on 'turbolinks:load', setupBraintree
$(document).on 'turbolinks:before-cache', removeDropIn
