import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log("Connected")
    this.isDragging = false
    this.startY;
    this.startBottom;
  }

  static targets = ["modal", "drag_handle", "btn_close"]

  show() {
    this.modalTarget.style.display = "block"
    this.modalTarget.style.bottom = 0
    document.body.style.overflow = "hidden"
  }

  hide() {
    this.modalTarget.style.display = "none"
    this.modalTarget.style.bottom = "-100%"
    document.body.style.overflow = "auto"
  }

  startDragging(event) {
    event.preventDefault()
    this.isDragging = true
    this.startY = event.clientY
    this.startBottom = parseInt(getComputedStyle(this.modalTarget).bottom)
  }

  drag(event) {
    event.preventDefault()
    if (!this.isDragging)
      return

    const deltaY = event.clientY - this.startY
    this.modalTarget.style.bottom = Math.max(this.startBottom - deltaY, 0) + "px"
  }

  stopDragging(event) {
    event.preventDefault()
    this.isDragging = false
    this.startY = null
    this.startBottom = null
  }
}
