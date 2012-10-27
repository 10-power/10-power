# Update the photo caption when it's changed on the edit / new essay page
YUI.add 'update-photo-caption-on-change', (Y) ->

  Y.namespace("App").UpdatePhotoCaptionOnChange = (essayId) ->
    updatePhotoCaption = (e) ->
      elm = e.target
      photoId = parseInt(elm.ancestor(".photo-form").getAttribute("data-photo-id"), 10)
      value = elm.get("value")
      cfg =
        method: "PUT"
        headers:
          "X-CSRF-Token": Y.one("meta[name=\"csrf-token\"]").getAttribute("content")

        data:
          caption: value

      Y.io "/admin/essays/" + essayId + "/photos/" + photoId, cfg

    if Y.one('#photos')
      Y.one("#photos").delegate "change", updatePhotoCaption, ".photo-form input[name=\"caption\"]", this

    return
, '0.0.1',
  requires: ['node', 'io']

YUI.add 'remove-photo-on-click', (Y) ->

  Y.namespace("App").RemovePhotoOnClick = (essayId) ->
    removePhoto = (e) ->
      elm = e.target
      photoId = parseInt(elm.ancestor(".photo-form").getAttribute("data-photo-id"), 10)

      cfg =
        method: "DELETE"
        headers:
          "X-CSRF-Token": Y.one("meta[name=\"csrf-token\"]").getAttribute("content")
        on:
          success: (tId, response) ->
            console.log tId, response
            elm.ancestor(".photo-form").remove()

      if confirm('Are you sure?')
        Y.io "/admin/essays/" + essayId + "/photos/" + photoId, cfg

    if Y.one('#photos')
      Y.one("#photos").delegate "click", removePhoto, ".photo-form a.delete", this

    return

, '0.0.1',
  requires: ['node', 'io']
