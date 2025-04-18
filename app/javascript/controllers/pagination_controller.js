import { Controller } from "@hotwired/stimulus"
import { useIntersection } from "stimulus-use"

export default class extends Controller {
  static values = {
    url: String
  }

  static targets = ["loading"]

  connect () {
    this.page = 1
    this.fetchingData = false
    this.hasNoMoreResults = false
    useIntersection(this)
  }

  async appear (){
    try {
      if (this.fetchingData || this.hasNoMoreResults) return

      this.fetchingData = true
      this.page++
      let response = await fetch(this.urlValue, {
        method: "GET",
        headers: {
          "X-Requested-With": "XMLHttpRequest",
          "Accept": "text/vnd.turbo-stream.html"
        },
        params: {
          page: this.page
        }
      })
      this.lastPageValue = response.headers.get('Total-Pages')
      this.checkForMoreResults()
      this.fetchingData = false
    } catch (error) {
      console.error("Error fetching data:", error)
    }
  }

  checkForMoreResults () {
    this.hasNoMoreResults = this.page == this.lastPageValue
    if (this.hasNoMoreResults) {
      this.removeLoading()
    }
  }

  removeLoading () {
    if (this.hasLoadingTarget) {
      this.loadingTarget.remove()
    }
  }
}
