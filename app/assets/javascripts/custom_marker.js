function CustomMarker(latlng, map, url, args) {
    this.latlng = latlng;
    this.args = args;
    this.url = url;
    this.setMap(map);
}

// <%= image_tag(attraction.image_url, height: '50', width: '50', style: 'vertical-align: bottom', class: 'img-circle') %>

CustomMarker.prototype = new google.maps.OverlayView();
CustomMarker.prototype.draw = function () {
    var self = this;
    var root = this.root;

    if (!root) {
        root = this.root = document.createElement('img');
        root.className = 'img-circle';
        root.style.position = 'absolute';
        root.style.cursor = 'pointer';
        root.style.border = '3px solid red';
        root.width = '56';
        root.height = '56';
        root.src = encodeURI(this.url.replace(/&amp;/g, '&'));
        var panes = this.getPanes();
        panes.overlayImage.appendChild(root);
    }

    var point = this.getProjection().fromLatLngToDivPixel(this.latlng);
    if (point) {
        root.style.left = (point.x) + 'px';
        root.style.top = (point.y) + 'px';
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