import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  get modal() {
    return document.getElementById("turbo-modal")
  }
  
  show() {
    this.modal.classList.add("is-active")
  }

  close() {
    this.modal.classList.remove("is-active")
  }
}
