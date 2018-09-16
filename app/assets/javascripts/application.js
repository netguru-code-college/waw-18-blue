// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//=require leaflet

//setup required vars
var map,
    icons = {
        location: L.icon({
            iconUrl: 'assets/beer.png',
            iconSize:     [24, 24], // size of the icon
            iconAnchor:   [12, 12], // point of the icon which will correspond to marker's location
            popupAnchor:  [-3, -3] // point from which the popup should open relative to the iconAnchor
        }),
        event: L.icon({
            iconUrl: 'assets/party.png',
            iconSize:     [24, 24], // size of the icon
            iconAnchor:   [-12, 12], // point of the icon which will correspond to marker's location
            popupAnchor:  [-3, -3] // point from which the popup should open relative to the iconAnchor
        })
    };

//map setup - provide default user coordinates in form of [Y-axis, X-axis]
//default - center of Warsaw = [52.232, 21.017]
function mapSetup() {
    var userCoords = [52.232, 21.017]
    map = L.map('markers-map').setView(userCoords, 12); //last arg -> zoom lvl
    // create the tile layer with correct attribution
    var osmUrl='https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
    var osmAttrib='Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors';
    var osm = new L.TileLayer(osmUrl, {minZoom: 8, maxZoom: 18, attribution: osmAttrib});
    map.addLayer(osm);
}

function placeMarkers(markers, type) {
    for (var i = 0; i < markers.length; i++) {
        marker = new L.marker([markers[i].latitude,markers[i].longitude], {icon: icons[type]})
            .bindPopup(generatePopup(markers[i], type))
            .addTo(map);
    }
}

function generatePopup(marker, type) {

    var popup = 'x';
        if (type == 'event') {
            popup += "<br/><b>Location: </b> "+marker.location_name;
        } else {
            popup += "<br/><b>Type: </b>"+marker.location_type;
        }

    if(type == 'location') {
        return "<b>Name: </b>"+marker.name+"<br/>"+
                "<b>Type: </b>"+marker.location_type+"<br/>"+
                "<b>Przypal: </b>"+ (marker.is_przypal ? 'Yes' : 'No') +"</b><br/>"+
                "<b>Address: </b>"+marker.address;
    } else {
        return marker.name+
                "<p style='text-align: center'>== Location ==</p>"+
                "<b>Name: </b>${marker.location_name}<br/>"+
                "<b>Przypal: </b>"+ (marker.is_przypal ? 'Yes' : 'No') +"</b><br/>"+
                "<b>Address: </b>"+marker.address;
    }
}