getTask = (task) ->
	"<li class='list-group-item'> #{task.name}</li>"


$(document).on "ajax:success", "form#task-form", (ev, data)->
	console.log data
	$("#tasks-box").append(getTask(data))
	$("#task-form").trigger("reset")
$(document).on "ajax:success", "form#task-form", (ev, data)->
	console.log data
