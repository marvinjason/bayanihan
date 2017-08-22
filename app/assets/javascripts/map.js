L.mapbox.accessToken = 'pk.eyJ1IjoibWF0dGhld2RlYW1hIiwiYSI6ImNpd2xkZ2J1cjAwMjQyem53dHRkZHc4NHAifQ.hT-pkHYcdrfY_4fbz1GMtw';
var map = L.mapbox.map('map')
    .setView([14.6041276, 120.988598], 14);
L.mapbox.styleLayer('mapbox://styles/matthewdeama/ciwldy4au00nf2pmqd9wdoi6x').addTo(map);
map.on('click', function(e) {
	$("#lat").val(e.latlng.lat);
	$("#lng").val(e.latlng.lng);
	$("#latlngRef").val("[" + e.latlng.lat + ", " + e.latlng.lng + "]");
});

var fireIcon = L.AwesomeMarkers.icon({
	prefix: 'glyphicon',
	icon: 'fire',
	markerColor: 'red'
});

var stormIcon = L.AwesomeMarkers.icon({
	prefix: 'glyphicon',
	icon: 'tint',
	markerColor: 'blue'
});

var quakeIcon = L.AwesomeMarkers.icon({
	prefix: 'glyphicon',
	icon: 'flash',
	markerColor: 'black'
});

function submitClickPoints() {
	var lat = $("#lat").val();
	var lng = $("#lng").val();
	var message = $("#message").val();
	var radius = $("#radius").val();

	addMarker(lat, lng, radius, message, checkDisasterToggle());

	$("#lat").val('');
	$("#lng").val('');
	$("#message").val('');
	$("#radius").val('');
}

function submitClickJSON() {
	var jsonText = $("#geojsonText").val();

	L.geoJSON(JSON.parse(jsonText)).addTo(map);

	$("#geojsonText").val('');
}

function checkDisasterToggle() {
	var icon;

	if($("#stormOption").is(":checked"))
		icon = stormIcon;
	else if($("#quakeOption").is(":checked"))
		icon = quakeIcon;
	else
		icon = fireIcon;

	return icon;
}

function addMarker(lat, lng, radius, message, icon) {
	if(message)
		L.marker([lat, lng], {
			icon: icon
		}).bindPopup(message).addTo(map);
	else
		L.marker([lat, lng], {
			icon: icon
		}).addTo(map);


	if(radius)
		L.circle([lat, lng], parseInt(radius), {
			color: icon.options.markerColor,
			weight: 1.5
		}).addTo(map);
}