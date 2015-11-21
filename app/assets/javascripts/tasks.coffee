# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('.collection').on 'click', '.checkbox-task', (e) ->
    id = $(this).attr('id')
    list_id = $(this).data('list-id')
    status = $(this).prop('checked')
    url = '/lists/' + list_id + '/task-status/' + id + '.json'
    label = $(this).next('label')

    if status
      label.addClass('strike')
    else
      label.removeClass('strike')

    $.ajax
      url: url
      type: 'POST'
      data: {status: status}
      dataType: 'json'
      error: (jqXHR) ->
        console.error(jqXHR.statusText)
        Materialize.toast('<i class="material-icons">error_outline</i> &nbsp;&nbsp;&nbsp;' + jqXHR.statusText, 4000, 'red darken-1');

$(document).ready(ready)
$(document).on('page:load', ready)