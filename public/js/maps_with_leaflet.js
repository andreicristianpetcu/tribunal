var show_court_performances_onmap = function(){
  court_performances.forEach(function(court) {
    var lat = court.latitudine;
    var lon = court.longitudine;
    var circle = L.circle([lat, lon], 5000, {
      color: 'red',
      fillColor: '#f03',
      fillOpacity: 5
    }).addTo(map);
    circle.bindPopup(court.localitate);
  });
};
show_court_performances_onmap();
