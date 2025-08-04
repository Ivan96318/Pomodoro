import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]
  
  connect() {
    console.log("Connected")
    this.isDragging = false
    this.startY = null;
    this.startBottom = null;
  }

  show() {
    this.modalTarget.style.display = "block"
    this.modalTarget.style.bottom = "0px"
    document.body.style.overflow = "hidden"
  }

  hide() {
    this.modalTarget.style.display = "none"
    this.modalTarget.style.bottom = "-100%"
    document.body.style.overflow = "auto"
  }

  startDragging(event) {
    console.log("Start dragging")
    event.preventDefault()
    this.isDragging = true
    this.startY = event.touches[0].clientY
    this.startBottom = parseInt(getComputedStyle(this.modalTarget).bottom)

    document.addEventListener("touchmove", this.drag.bind(this), { passive: false });
    document.addEventListener("touchend", this.stopDragging.bind(this));
  }

  drag(event) {
    console.log("dragging")
    event.preventDefault()
    if (!this.isDragging) return

    const deltaY = event.touches[0].clientY - this.startY
    this.modalTarget.style.bottom = Math.max(this.startBottom - deltaY, 0) + "px"
  }

  stopDragging(event) {
    console.log("Stop dragging")
    event.preventDefault()
    this.isDragging = false
    document.removeEventListener("touchmove", this.drag.bind(this));
    document.removeEventListener("touchend", this.stopDragging.bind(this));
    this.startY = null
    this.startBottom = null
  }
}
