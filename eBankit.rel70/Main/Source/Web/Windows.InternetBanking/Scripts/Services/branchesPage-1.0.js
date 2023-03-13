
eBankit.Presentation.Branches = {}

eBankit.Presentation.Branches.branchMarkers = null;
eBankit.Presentation.Branches.map = null;
eBankit.Presentation.Branches.infoWindow = null;

eBankit.Presentation.Branches.Initialize = function()
{
    // Create map
    var mapOptions = {
        center: new google.maps.LatLng(branchesMarkers[0].lat, branchesMarkers[0].lng),
        zoom: 12
    };

    var map = new google.maps.Map(document.getElementById("branchesMap"), mapOptions);
    var mapBounds = new google.maps.LatLngBounds();

    var infoWindow = new google.maps.InfoWindow();

    // Create markers
    var branchMarkers = new Array();

    for (i = 0; i < branchesMarkers.length; i++)
    {
        var branch = branchesMarkers[i];

        // Add marker to map
        var markerLatlng = new google.maps.LatLng(branch.lat, branch.lng);
        var marker = new google.maps.Marker({
            position: markerLatlng,
            map: map,
            title: branch.title,
            icon: branch.iconUrl
        });

        branchMarkers.push(marker);

        // Create info windows
        (function (marker, branch)
        {
            google.maps.event.addListener(marker, "click", function (e) {
                infoWindow.setContent(branch.infoContent);
                infoWindow.open(map, marker);
            });
        })(marker, branch);

        // Add marker to map view bounds
        mapBounds.extend(markerLatlng);
    }

    // Center and zoom map to contains all markers
    map.fitBounds(mapBounds);

    eBankit.Presentation.Branches.branchMarkers = branchMarkers;
    eBankit.Presentation.Branches.map = map;
    eBankit.Presentation.Branches.infoWindow = infoWindow;
}

google.maps.event.addDomListener(window, 'load', eBankit.Presentation.Branches.Initialize);


eBankit.Presentation.Branches.SelectBranch = function (branchIndex)
{
    var marker = eBankit.Presentation.Branches.branchMarkers[branchIndex];
    eBankit.Presentation.Branches.map.panTo(marker.getPosition());
    eBankit.Presentation.Branches.map.setZoom(16);
    //eBankit.Presentation.Branches.infoWindow.open(eBankit.Presentation.Branches.map, marker);
}