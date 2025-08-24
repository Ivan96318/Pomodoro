import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  get modal() {
    return document.getElementById("turbo-modal");
  }

  connect() {
    this.isDragging = false;
    this.startY = null;
    this.startBottom = null;
  }

  show() {
    this.modal.style.display = "block";
    this.modal.style.bottom = "0px";
    document.body.style.overflow = "hidden";
  }

  hide() {
    this.modal.style.display = "none";
    this.modal.style.bottom = "-100%";
    document.body.style.overflow = "auto";
  }

  startDragging(event) {
    event.preventDefault();
    this.isDragging = true;
    this.startY = event.touches[0].clientY;
    this.startBottom = parseInt(getComputedStyle(this.modal).bottom);

    document.addEventListener("touchmove", this.drag.bind(this), {
      passive: false,
    });
    document.addEventListener("touchend", this.stopDragging.bind(this));
  }

  drag(event) {
    event.preventDefault();
    if (!this.isDragging) return;

    const deltaY = event.touches[0].clientY - this.startY;
    this.modal.style.bottom = Math.max(this.startBottom - deltaY, 0) + "px";
  }

  stopDragging(event) {
    event.preventDefault();
    this.isDragging = false;
    document.removeEventListener("touchmove", this.drag.bind(this));
    document.removeEventListener("touchend", this.stopDragging.bind(this));
    this.startY = null;
    this.startBottom = null;
  }
}
