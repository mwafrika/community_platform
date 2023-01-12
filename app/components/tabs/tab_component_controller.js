import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["content", "tab", "member", "all-groups-tab", "created"];

  connect() {
    // this.switch();
  }

  switch() {
    this.tabTargets.forEach((tab, index) => {
      tab.addEventListener("click", (event) => {
        event.preventDefault();

        this.tabTargets.forEach((tab) => {
          let getList = tab.children;
          console.log("eeeee", getList);
          tab.classList.remove("active");
        });
        this.contentTargets.forEach((content) =>
          content.classList.remove("active")
        );
        console.log(
          "tabTargets",
          this.tabTargets[index].classList,
          this.contentTargets[index].classList
        );
        this.tabTargets[index].classList.add("active");
        this.contentTargets[index].classList.add("active");
      });
    });
  }
}
