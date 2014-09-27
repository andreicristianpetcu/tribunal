# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
make_donut = (component, percentage, colour) ->
  start_arch = -Math.PI * 0.75
  colour = "#5BC0DE"  if typeof colour is "undefined"
  vis = d3.select("#" + component)
  arc = d3.svg.arc().innerRadius(50).outerRadius(100).startAngle(start_arch).endAngle(start_arch + 0.02 * Math.PI * percentage)
  vis.append("path").style("fill", (d) ->
    colour
  ).attr("d", arc).attr "transform", "translate(100,100)"
  return

ready = undefined
ready = ->
  value = $("#performance_indicator").attr("data-value")
  make_donut "performance_indicator_donut", value, "#F0AD4E"
  $("a[href=\"" + location.hash + "\"]").tab "show"  if location.hash isnt ""
  $("a[data-toggle=\"tab\"]").on "shown.bs.tab", (e) ->
    location.hash = $(e.target).attr("href").substr(1)

  $("a[data-toggle=\"tab\"]").each ->
    @on "click", ->
      $("nav.pagination span a").each ->
        href = $(this).attr("href").split("#")[0]
        if href
          href += $("li.active a[data-toggle=\"tab\"]").attr("href")
          $(this).attr "href", href
        return

      return

    return

  return

$(document).ready ready
$(document).on "page:load", ready
