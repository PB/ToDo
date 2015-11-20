# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  Materialize.updateTextFields()
  Waves.displayEffect()
  $(".button-collapse").sideNav()
  $('input').characterCounter()


  # Before from submit
  $('.form-class').submit (e)->
    e.preventDefault()
    if (validateForm())
      $('.form-class')[0].submit()
    else
      showError('Please fill in all fields')

$(document).ready(ready)
$(document).on('page:load', ready)

# Validate from
validateForm = ->
  isValid = true
  $('.input-field > input').each ->
    if ( $(this).val() == '' )
      isValid = false
      $(this).addClass('invalid')
  isValid

#Error
showError = (text)->
  Materialize.toast('<i class="material-icons">error_outline</i> &nbsp;&nbsp;&nbsp; ' + text, 4000, 'red darken-1')