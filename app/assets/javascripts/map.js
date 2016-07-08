function initialize() {
  console.log("initialized")
    var map;
    var bounds = new google.maps.LatLngBounds();
    // console.log(location);
    var mapOptions = {
        zoom: 50,
        mapTypeId: 'roadmap'
    };

    // Info Window Content
    var infoWindowContent = [];
    // var infoWindowContent = [
    //     ["Hello"],
    //     ["Test"]
    // ];

    // var x = document.getElementById("ip");

    //  // (navigator.geolocation) {
    //    navigator.geolocation.getCurrentPosition(positionArray);
    //    // console.log("GEO IS " + geo)
    //  // };


    // function positionArray(position) {
    //     // x.innerHTML = "Latitude: " + position.coords.latitude + "<br>Longitude: " + position.coords.longitude;
    //     var latit = position.coords.latitude;
    //     var longit = position.coords.longitude;
    //     console.log ("this will return " + [latit, longit])
    //     var loc = [latit, longit];
    //     $.post('<%= filter_based_on_location_path %>', loc);
    //     // return [latit, longit];
    // };


    $.ajax({
        url: '/posts_json',
        dataType: "json"
    })
    .done(function(response){
        for (i=0; i<response.length; i++){
            var petname = response[i].animal.name;
            var petbreed = response[i].animal.breed.name;
            // var petcolor
            // var pet_additional
            // var contact_name
            // var contact_phone
            // var contact_email
            var image_placement = "'<img src="+response[i].animal.image_url_thumb+">'";
            infoWindowContent.push([petname,petbreed,image_placement])
            };
            // console.log(infoWindowContent);
    });

    // Display a map on the page
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    map.setTilt(45);

    // Multiple Markers
    //var markers = [
    //    ['London Eye, London', 51.503454,-0.119562],
    //    ['Palace of Westminster, London', 51.499633,-0.124755]
    //];
    //var infoWindowContent = [
    //     ["Hello"],
    //     ["Test"]
    // ];


    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker, i;

    // Loop through our array of markers & place each one on the map
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][0], markers[i][1]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: "markers"
        });

        // Allow each marker to have an info window
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent("<b>" + infoWindowContent[i][0] + "<b>" + "<br>" + infoWindowContent[i][2] + "<br>" + infoWindowContent[i][1]);
                infoWindow.open(map, marker);
            }
        })(marker, i));

        // Automatically center the map fitting all markers on the screen
        map.fitBounds(bounds);
    }

    // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(12);
        google.maps.event.removeListener(boundsListener);
    });
};
