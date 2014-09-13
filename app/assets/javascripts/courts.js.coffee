# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# make_donut = (component, percentage, colour) ->
#   start_arch = -Math.PI*0.75
#
#   colour = "#F0AD4E"
#
#   vis = d3.select("#" + component)
#   arc = d3.svg.arc()
#     .innerRadius(50)
#     .outerRadius(100)
#     .startAngle(start_arch)
#     .endAngle(start_arch + 0.02*Math.PI*percentage)
#
#     vis.append("path")
#     .style("fill", (d) -> colour)
#     .attr("d", arc)
#     .attr("transform", "translate(100,100)")
