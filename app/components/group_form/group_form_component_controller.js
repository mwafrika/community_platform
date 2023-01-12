import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["modal", "remove", "cancel"];

  open(event) {
    event.preventDefault();
    this.modalTarget.classList.add("open");
    window.addEventListener("click", this.close.bind(this));
  }

  close(event) {
    if (event.target === this.modalTarget) {
      this.modalTarget.classList.remove("open");
      window.removeEventListener("click", this.close.bind(this));
    }
    if (event.target === this.removeTarget) {
      console.log("remove", event);
      this.modalTarget.classList.remove("open");
    }
    if (event.target === this.cancelTarget) {
      console.log("remove", event);
      this.modalTarget.classList.remove("open");
    }
  }
}
