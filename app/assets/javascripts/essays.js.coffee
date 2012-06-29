# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

YUI().use "node", (Y) ->
  window.PhotoBrowser = (photos) ->

    action = Y.one("#action")

    photo = Y.one("#photo")
    photo_image = photo.one("img")
    photo_caption = photo.one(".caption")
    
    log = (s) ->
      console && console.log(s)

    updatePhoto = (n) ->
      p = photos[n]
      photo_image.setAttribute "src", p.url
      photo_caption.set "innerHTML", p.caption
      photo.setAttribute "data-number", n + 1
    
    startOver = (e) ->
      action.hide()
      updatePhoto 0
      photo.show()
      e.preventDefault();
    
    showNext = ->
      num = parseInt(photo.getAttribute("data-number"), 10)
      if num < photos.length
        if photos[num]
          updatePhoto num
        else
          log "Unexpected error. Photo key does not exist."
      else if num is photos.length
        photo.hide()
        action.show()
      else
        # Do nothing

    photo_image.on "click", showNext

    action.one(".start-over").on "click", startOver
