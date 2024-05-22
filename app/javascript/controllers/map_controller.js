import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
import MapboxGeocoder from "@mapbox/mapbox-gl-geocoder"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
    marker: Object
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    if (Object.keys(this.markerValue).length === 0) {
      this.#addMarkerToMap()
      this.#fitMapToMarker()
    } else {
      this.#addMarkersToMap()
      this.#fitMapToMarkers()
    }

    this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl }))
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement("div")
    customMarker.innerHTML = marker.marker_html


      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // Add this
        .addTo(this.map)
    });
  }

  #addMarkerToMap() {
    console.log(this.markerValue)

      const popup = new mapboxgl.Popup().setHTML(this.markerValue.info_window_html)

      const customMarker = document.createElement("div")
    customMarker.innerHTML = this.markerValue.marker_html


      new mapboxgl.Marker(customMarker)
        .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
        .setPopup(popup) // Add this
        .addTo(this.map)
      }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
  #fitMapToMarker() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([this.markerValue.lng, this.markerValue.lat])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}
