import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form"]

  connect() {
    this.element.addEventListener("turbo:submit-end", this.handleSubmit.bind(this))
  }

  handleSubmit(event) {
    const [data, status] = event.detail
    if (status === "success") {
      this.showSuccessMessage()
      this.resetForm()
    } else {
      this.showErrorMessage()
    }
  }

  showSuccessMessage() {
    const alert = document.createElement("div")
    alert.className = "alert alert-success mt-3"
    alert.textContent = "Thank you for your message! We'll get back to you soon."
    this.element.appendChild(alert)
  }

  showErrorMessage() {
    const alert = document.createElement("div")
    alert.className = "alert alert-danger mt-3"
    alert.textContent = "Sorry, there was an error sending your message. Please try again."
    this.element.appendChild(alert)
  }

  resetForm() {
    this.element.reset()
  }
} 