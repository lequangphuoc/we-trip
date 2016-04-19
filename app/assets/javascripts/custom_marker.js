function CustomMarker(latlng, map, url, title, args) {
    this.latlng = latlng;
    this.url = url;
    this.title = title;
    this.map = map;
    this.args = args;
    this.setMap(map);
}

CustomMarker.prototype = new google.maps.OverlayView();
CustomMarker.prototype.draw = function () {
    var self = this;
    var root = this.root;

    // styling
    if (!root) {
        root = this.root = document.createElement('img');
        root.className = 'img-circle';
        root.style.position = 'absolute';
        root.style.cursor = 'pointer';
        root.style.border = '3px solid red';
        root.width = '50';
        root.height = '50';
        root.src = encodeURI(this.url.replace(/&amp;/g, '&'));
        var panes = this.getPanes();
        panes.overlayImage.appendChild(root);
    }

    // add infowondow
    var infowindow = new google.maps.InfoWindow({
        content: "<h4>" + this.title + "<h4/>"
    });
    google.maps.event.addDomListener(root, 'click', function() {
        infowindow.open(self.map, self);
    });

    // add position
    var point = this.getProjection().fromLatLngToDivPixel(this.latlng);
    if (point) {
        root.style.left = (point.x - 25) + 'px';
        root.style.top = (point.y - 25) + 'px';
    }
};

CustomMarker.prototype.remove = function () {
    if (this.root) {
        this.root.parentNode.removeChild(this.root);
        this.root = null;
    }
};
CustomMarker.prototype.getPosition = function () {
    return this.latlng;
};
