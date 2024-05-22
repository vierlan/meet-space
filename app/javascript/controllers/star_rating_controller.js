import { Controller } from "@hotwired/stimulus"
import StarRating from "star-rating.js"

export default class extends Controller {
  connect() {
    console.log("Hello from star_rating_controller.js")
    new StarRating(this.element)
  }
}
