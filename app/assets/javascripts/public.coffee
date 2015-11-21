ready = ->
  socky = new Socky.Client('ws://murmuring-sands-8669.herokuapp.com:3001/websocket/to_do')
  channel = socky.subscribe($('#channel').text());
  channel.bind "create_task", (task) ->
    $('.collection').append('<li class="collection-item">' +
        '<input data-list-id="' + task.list_id + '" disabled="disabled" id="' + task.id + '" type="checkbox">' +
        '<label for="' + task.id + '">' + task.name + '</label>' +
    '</li>')

  channel.bind "delete_task", (id) ->
    $('#' + id).closest('li').hide('slow')

  channel.bind "change_status", (task) ->
    $('#' + task.id).prop('checked', task.status)
    label = $('#' + task.id).next('label')

    if task.status
      label.addClass('strike')
    else
      label.removeClass('strike')

$(document).ready(ready)
$(document).on('page:load', ready)