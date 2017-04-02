_task = null
_save_or_play = 1; #0 = save, 1 = play
sec_to_time = (seconds) ->
  sec_num = parseInt(seconds, 10);
  hours   = Math.floor(sec_num / 3600);
  minutes = Math.floor((sec_num - (hours * 3600)) / 60);
  seconds = sec_num - (hours * 3600) - (minutes * 60);

  if hours   < 10
    hours   = "0"+hours;
  if minutes < 10
    minutes = "0"+minutes;
  if seconds < 10
    seconds = "0"+seconds;
  hours+':'+minutes+':'+seconds;

complements = () ->
  $("#task-complements").toggleClass("hidden")
  if _save_or_play == 0
    _save_or_play = 1
    $("#start-new-task").val("Play")
    $("#show-task-complements").html("Show more")
  else
    _save_or_play = 0
    $("#start-new-task").val("Save")
    $("#show-task-complements").html("Show less")

run = () ->
  $("#current-time-readable").html(sec_to_time(_task.total_time++))

update_task = () ->
  $.ajax(
    url: "/tasks/#{_task.id}.json",
    data: {"task[total_time]": _task.total_time},
    method: "PUT"
  ).done (html) ->
    # $("#results").append html
    location.reload()
  .error (data) ->
    console.log data

$(document).on "ajax:success", "form#task-form", (ev, data)->
  console.log data
  if _save_or_play == 1
    setInterval(run, 1000)
    $("#stop-current-task").toggleClass("hidden")
    $("#start-new-task").toggleClass("hidden")
  else
    complements()
    location.reload()
  _task = data
$(document).on "ajax:success", "form#task-form", (ev, data)->
  console.log data

$("#stop-current-task").click((args) ->
  update_task()
)

$(".time-control").click(() ->
  id = $(this).attr("id")
  time_control = "#btn-"+id
  text = $(time_control).html()
  if text == "play"
    $(time_control).html("pause")
    $.ajax(
      url: "/tasks/#{id}.json",
      method: "GET"
    ).done (data) ->
      _task = data
      console.log _task
      $("#task_name").val(_task.name)
      $("#stop-current-task").toggleClass("hidden")
      $("#start-new-task").toggleClass("hidden")
      setInterval(run, 1000)
    .error (data) ->
      console.log data
  else
    $(time_control).html("play")
    update_task()
)

$(".manual-time").change((args) ->
  hh = $("#hh").val()
  mm = $("#mm").val()
  ss = $("#ss").val()
  hh = hh * 3600
  mm = mm * 60
  ss = ss * 1
  $("#task_total_time").val(hh + mm + ss)
)

$("#show-task-complements").click((args) ->
  complements()
)
