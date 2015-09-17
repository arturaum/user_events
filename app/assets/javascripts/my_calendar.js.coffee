# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

changeUserEvents = ->
  if $(@).attr("name") is "select-user-events"
    user = $(@).val()
  else
    user = $(@).data("user")
  
  eventsOptions =
    events:
      url: '/calendar/events/get_events',
      type: 'GET',
      data:
        user: user
        
  user_full_calendar_options = $.extend({}, full_calendar_options, eventsOptions)

  $('.calendar').empty()
  $('.calendar').fullCalendar(user_full_calendar_options)


$(document).ready ->
  $("#user-panel").on "click", ".user-events", changeUserEvents
  $("#user-panel").on "change", "#select-user-events", changeUserEvents
  $("#user-panel").find("#my-events").trigger("click")
