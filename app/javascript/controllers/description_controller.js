import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="description"
export default class extends Controller {
  static targets = ["description"]

  connect() {
    console.log("Description controller connected")
  }
  showDescription(event) {
    this.descriptionTarget.textContent = event.currentTarget.dataset.description
  }

  resetDescription() {
    this.descriptionTarget.textContent = "Hover over the images to see descriptions."
  }
}
