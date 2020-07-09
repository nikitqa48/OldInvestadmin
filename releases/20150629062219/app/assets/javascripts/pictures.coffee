class PictureManager
  constructor: (@el) ->
    @template = @el.find('.picture.template')
    addButton = @el.find('a.add-picture-btn')

    @apply()

    addButton.click =>
      @createPicture()

  createPicture: =>
    picture = @template.clone()
    newSource = picture.html().replace('[pictures_attributes][0]', '[pictures_attributes][' + $.Guid.New() + ']')
    picture.html(newSource).insertAfter(@template).removeClass('template')
    new Picture(picture)

  # Apply excisting pictures
  apply: =>
    @el.find('.picture:not(.template)').each ->
      new Picture($(@))

# <b>Picture</b> object represents a single picture
class Picture
  constructor: (@el) ->
    @removeButton = @el.find('a.destroy-picture-btn')

    that = @

    @removeButton.click (event) ->
      event.preventDefault()
      if $(@).attr('href') == '#' then that.remove() else that.destroy()
      return false

  # Simply remove the HTML element without the
  # <b>entity</b> distraction.
  remove: =>
    @el.fadeOut 100, ->
      @remove()

  # Destroy an object via <b>delete</b> remote call
  destroy: =>
    that = @
    $.ajax
      type: 'DELETE'
      url: @removeButton.attr('href')
      success: (data) ->
        that.remove()

$ ->
  new PictureManager($('.pictures-panel'))