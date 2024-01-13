import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["burgerMenu", "navbarMenu"]

  toggleMenu () {
    this.burgerMenuTarget.classList.toggle("is-active")
    this.navbarMenuTarget.classList.toggle("is-active")
  }
}
