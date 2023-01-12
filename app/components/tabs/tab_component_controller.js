
import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["tab", "created", "member"];

  toggle(event) {
    event.preventDefault();

    // Remove the active class from all <li> elements
    this.tabTargets.forEach(tab => tab.classList.remove("active"));

    // Add the active class to the clicked <li> element
    event.currentTarget.closest("li").classList.add("active");

    // Hide all tab content sections
    this.createdTargets.forEach(created => created.classList.add("hidden"));
    this.memberTargets.forEach(member => member.classList.add("hidden"));

    // Show the tab content section associated with the clicked <a> element's data-target attribute
    const target = event.currentTarget.dataset.target;
    if (target === "tabs--tab-component.created") {
      this.createdTargets.forEach(created => created.classList.remove("hidden"));
    } else if (target === "tabs--tab-component.member") {
      this.memberTargets.forEach(member => member.classList.remove("hidden"));
    }
  }
}

