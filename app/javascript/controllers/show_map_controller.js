import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'
// Connects to data-controller="show-map"
export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    console.log("show map ")
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })
    this.#addMarkerToMap()
    this.#fitMapToMarker()
  }

  #addMarkerToMap() {
    const marker = this.markerValue

    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(this.map)
    }

  #fitMapToMarker() {
    const bounds = new mapboxgl.LngLatBounds()
    const marker = this.markerValue
    bounds.extend([ marker.lng, marker.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
