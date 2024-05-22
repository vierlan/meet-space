import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Hello from form_submit_controller.js")
    // new StarRating(this.element)
  }
  submit(event) {
    console.log(event.currentTarget)
    event.element.submit();
  }
}
