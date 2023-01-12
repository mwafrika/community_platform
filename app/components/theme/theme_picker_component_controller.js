import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  // static targets = ["select"];
  static targets = ["body"];
  change(event) {
    // document.body.className = event.target.value;
  }

  initialize() {
    let currentTheme = localStorage.getItem("theme") || "light";
    this.bodyTarget.classList.add(currentTheme);
  }

  toggleTheme(event) {
    let currentTheme = localStorage.getItem("theme") || "light";
    let newTheme = currentTheme === "light" ? "dark" : "light";
    localStorage.setItem("theme", newTheme);
    this.body.classList.add(newTheme);
    // document.body.className = newTheme;
  }
}
