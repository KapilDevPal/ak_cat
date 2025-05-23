import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["title", "subtitle"]

  connect() {
    this.animateElements()
  }

  animateElements() {
    this.titleTarget.style.opacity = "0"
    this.subtitleTarget.style.opacity = "0"
    
    setTimeout(() => {
      this.titleTarget.style.transition = "opacity 1s ease-in"
      this.titleTarget.style.opacity = "1"
    }, 500)

    setTimeout(() => {
      this.subtitleTarget.style.transition = "opacity 1s ease-in"
      this.subtitleTarget.style.opacity = "1"
    }, 1000)
  }
} 