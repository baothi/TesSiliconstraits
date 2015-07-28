# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class window.Profile
  constructor: ->
    @AvatarCropper()
    @imagepreview()

# jQuery ->
#   new AvatarCropper()

  class AvatarCropper
    constructor: ->
      $('#cropbox').Jcrop
        aspectRatio: 1
        setSelect: [0, 0, 600, 600]
        onSelect: @update
        onChange: @update
  
    update: (coords) =>
      $('#user_crop_x').val(coords.x)
      $('#user_crop_y').val(coords.y)
      $('#user_crop_w').val(coords.w)
      $('#user_crop_h').val(coords.h)
      @updatePreview(coords)

    updatePreview: (coords) =>
            $('#preview').css
                  width: Math.round(100/coords.w * $('#cropbox').width()) + 'px'
                  height: Math.round(100/coords.h * $('#cropbox').height()) + 'px'
                  marginLeft: '-' + Math.round(100/coords.w * coords.x) + 'px'
                  marginTop: '-' + Math.round(100/coords.h * coords.y) + 'px'

  class imagepreview
    constructor: ->
      $(document).ready ->
      preview = $('.upload-preview img')
      $('.file').change (event) ->
        input = $(event.currentTarget)
        file = input[0].files[0]
        reader = new FileReader

        reader.onload = (e) ->
          image_base64 = e.target.result
          preview.attr 'src', image_base64
          return

        reader.readAsDataURL file
        return
      return