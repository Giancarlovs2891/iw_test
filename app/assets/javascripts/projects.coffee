getProject = (project) ->
	"<option value='#{project.id}'> #{project.name}</option>"


$(document).on "ajax:success", "form#project-form", (ev, data)->
	console.log data
	$("#task_project_id").append(getProject(data))
	$("#project-form").trigger("reset")
$(document).on "ajax:success", "form#project-form", (ev, data)->
	console.log data
