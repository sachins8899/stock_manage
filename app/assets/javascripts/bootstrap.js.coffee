jQuery ->
  $("a[rel~=popover], .has-popover").popover()
  $("a[rel~=tooltip], .has-tooltip").tooltip()

 $ ->
      flashCallback = ->
        $(".alert").fadeOut()
      $(".alert").bind 'click', (ev) =>
        $(".alert").fadeOut()
      setTimeout flashCallback, 3000