import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="remove-flash"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.style.opacity = 0
      setTimeout(() => {
        this.element.remove()
      }, 600)
    }, 3000)
  }

  removeNow() {
    this.element.remove()
  }
}
