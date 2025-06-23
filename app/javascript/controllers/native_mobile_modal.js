import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.startY = 0
    this.currentY = 0
    this.isDragging = false
  }

  open() {
    this.element.classList.add("is-active")
    document.documentElement.classList.add("is-clipped")

    // Dispatch custom event
    this.dispatch("opened", { detail: { modalId: this.element.id } })
  }

  close() {
    this.element.classList.remove("is-active")
    document.documentElement.classList.remove("is-clipped")

    // Dispatch custom event
    this.dispatch("closed", { detail: { modalId: this.element.id } })
  }

  closeOnOverlay(event) {
    if (event.target === this.element) {
      this.close()
    }
  }

  closeOnEscape(event) {
    if (event.key === "Escape" && this.element.classList.contains("is-active")) {
      this.close()
    }
  }

  handleTouchStart(event) {
    this.startY = event.touches[0].clientY
    this.isDragging = true
  }

  handleTouchMove(event) {
    if (!this.isDragging) return

    this.currentY = event.touches[0].clientY
    const deltaY = this.currentY - this.startY

    // Solo permitir deslizar hacia abajo
    if (deltaY > 0) {
      const tanslateY = Math.min(deltaY, 100)
      this.containerTarget.style.transform = `translateY(${tanslateY}px)`
    }
  }

  handleTouchEnd(event) {
    if (!this.idDragging) return

    const deltaY = this.currentY - this.startY

    // si se deslizó mas de 50px hacia abajo, cerrar el modal
    if (deltaY > 50) {
      this.close()
    }

    // Reset position
    this.containerTarget.style.transform = "tanslateY(0)"
    this.isDragging = false
  }

  // Action personalizable desde el exterior
  triggerAction(event) {
    const action = event.currentTarget.dataset.modalAction
    if (action && typeof this[action] === "function") {
      this[action](event)
    }
  }
}
