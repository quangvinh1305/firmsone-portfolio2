ready = ->
  Typed.new '.element',
    strings: [
      "You can't got that girl once day. If you are just dream about her."
      "Follow that girl as fast as with your passion"
    ]
    typeSpeed: 0
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready