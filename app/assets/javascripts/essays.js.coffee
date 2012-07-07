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

YUI.add "location-search", (Y) ->

  locationTemplate = '<div class="location">{city}, {region}, {country}</div>'

  LocationSearch = {

    formatLocationName: (loc) ->
      loc.name

    locationFormatter: (query, results) ->
      Y.Array.map results, (result) ->
        loc = result.raw
        Y.Lang.sub locationTemplate,
          city: loc.name
          region: loc.admin1 and loc.admin1.content
          country: loc.country.content

    start: (config) ->
      if config.hasOwnProperty?('node')
        inputNode = Y.one(config.node)
      else
         Y.fail('No node provided')

      inputNode.plug Y.Plugin.AutoComplete,
        resultFormatter: @locationFormatter
        resultHighlighter: "phraseMatch"
        resultTextLocator: "place.name"
        source: "select * from geo.places where text=\"{query}\""

      inputNode.ac.on "select", (e) ->
        e.preventDefault()

        result = e.result

        field_loc_name = Y.one("#essay_location")
        field_loc_latitude = Y.one("#essay_lat")
        field_loc_longitude = Y.one("#essay_lng")

        console.log result, e, field_loc_name, field_loc_latitude, field_loc_longitude

        inputNode.select()
        inputNode.ac.hide()

        field_loc_name.set "value", result.raw.name + ', ' + result.raw.country.content
        field_loc_longitude.set "value", result.raw.centroid.longitude
        field_loc_latitude.set "value", result.raw.centroid.latitude

  }

  Y.namespace('PowerOf10').LocationSearch = LocationSearch

, "0.0.1",
   requires: ["autocomplete", "autocomplete-highlighters", "node"]