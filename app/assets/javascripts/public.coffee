ready = ->
  if($(".public-view").length > 0)
    socky = new Socky.Client(ws_host + '/websocket/to_do')
    channel = socky.subscribe(channel_hash)
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

    setInterval () ->
      channel.trigger("keep_alive", { data: 'ok' })
    , 30000

$(document).ready(ready)
$(document).on('page:load', ready)