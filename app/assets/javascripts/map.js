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
    var markers =[];

    $.ajax({
        url: '/posts_json',
        dataType: "json"
    })
    .done(function(response){
        console.log("LENGTH IS==========");
        console.log(response.length);
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
            markers.push([response[i].lat, response[i].lng])
            };
    //put all the following code in the ajax success so that the number os items that the controller sent back using location within 1 mile, works!

    // Display a map on the page
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    map.setTilt(45);

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
});
};
