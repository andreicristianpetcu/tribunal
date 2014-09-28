var show_court_performances_onmap = function(){
  court_performances.forEach(function(court) {
    var indicator = court.indice;
    var lat = court.latitudine;
    var lon = court.longitudine;

    var colour = "#D9534F";
    if(indicator > 0 && indicator < 1 ) {
      colour = "#F8F774";
    } else if (indicator > 1) {
      colour = "#5CB85C";
    }
    var circle = L.circleMarker([lat, lon], {
      color: "black",
      fillColor: colour,
      fillOpacity: 0.9, 
      riseOnHover: true
    });
    circle.addTo(map);
    circle.bindPopup(court.localitate + "</br> Indice " + indicator);
  });
};
show_court_performances_onmap();
