import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]
  
  connect() {
    console.log("Connected")
    this.isDragging = false
    this.startY;
    this.startBottom;
  }

  show() {
    this.modalTarget.style.display = "block"
    this.modalTarget.style.bottom = 0
    document.body.style.overflow = "hidden"
  }

  hide() {
    console.log("hide method")
    this.modalTarget.style.display = "none"
    this.modalTarget.style.bottom = "-100%"
    document.body.style.overflow = "auto"
  }

  startDragging(event) {
    console.log("Start dragging")
    event.preventDefault()
    this.isDragging = true
    this.startY = event.clientY
    this.startBottom = parseInt(getComputedStyle(this.modalTarget).bottom)

    document.addEventListener("mousemove", this.drag);
    document.addEventListener("mouseup", this.stopDragging);
  }

  drag(event) {
    console.log("dragging")
    event.preventDefault()
    if (!this.isDragging)
      return

    const deltaY = event.clientY - this.startY
    this.modalTarget.style.bottom = Math.max(this.startBottom - deltaY, 0) + "px"
  }

  stopDragging(event) {
    console.log("Stop dragging")
    event.preventDefault()
    this.isDragging = false
    this.startY = null
    this.startBottom = null
  }
}
