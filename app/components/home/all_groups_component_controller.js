import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  debounce(func, wait) {
    let timeout;
    return (...args) => {
      clearTimeout(timeout);
      timeout = setTimeout(() => func(...args), wait);
    };
  }
  showAll = this.debounce(() => {
    // this.element.classList.add("loading");
    fetch("/groups/all")
      .then((response) => response.json())
      .then((groups) => {
        // this.element.classList.remove("loading");
        this.renderGroups(groups, "all");
      });
  }, 500);

  showMy = this.debounce(() => {
    // this.element.classList.add("loading");
    fetch("/groups/my")
      .then((response) => response.json())
      .then((groups) => {
        // this.element.classList.remove("loading");
        this.renderGroups(groups, "my");
      });
  }, 500);

  showMember = this.debounce(() => {
    // this.element.classList.add("loading");
    fetch("/groups/member")
      .then((response) => response.json())
      .then((groups) => {
        // this.element.classList.remove("loading");
        this.renderGroups(groups, "member");
      });
  }, 500);

  renderGroups(groups, type) {
    const container = this.element.querySelector(
      `[data-target="home--all-groups-component.${type}"]`
    );
    const component = document.createElement("groups-list");
    component.groups = groups;
    container.innerHTML = "";
    container.appendChild(component);

    for (const group of groups) {
      const groupElement = document.createElement("div");
      groupElement.innerHTML = `
      <div class="flex justify-between">
        <div class="">
          ${group.name}
        </div>
        <button class="px-20 py-[20px] w-[200px] bg-blue-500 text-white">Join<button/>
      </div>
      `;
      component.appendChild(groupElement);
    }
  }

  connect(e) {
    const container = this.element.querySelector(
      `[data-target="home--all-groups-component.all"]`
    );
    fetch("/groups/all")
      .then((response) => response.json())
      .then((groups) => {
        console.log(groups);
        const component = document.createElement("groups-list");
        component.groups = groups;
        container.innerHTML = "";

        container.appendChild(component);

        for (const group of groups) {
          let groupElement = document.createElement("div");
          let list = document.createElement("div");
          let groupName = document.createElement("div");
          let groupButton = document.createElement("div");
          groupButton.classList.add(
            "bg-blue-500",
            "w-[20%]",
            "text-center",
            "m-5",
            "text-white",
            "cursor-pointer",
            "p-4",
            "even:bg-gray-400",
            "rounded-lg"
          );
          groupName.innerText = group.name;
          // if tab1 is selected, then groupButton.innerText = "join", if tab2 is selected, then groupButton.innerText = "leave"
          groupButton.innerText = "join";
          component.classList.add(
            "gap-y-5",
            "flex",
            "flex-col",
            "justify-between"
          );
          component.style.rowGap = "20px";
          component.classList.add("gap-y-5");
          list.classList.add("flex", "justify-between");
          list.appendChild(groupName);
          list.appendChild(groupButton);
          groupElement.appendChild(list);
          component.appendChild(groupElement);
        }
      });
  }
}

function initTabs() {
  const tabs = document.querySelectorAll(".tab");
  tabs.forEach((tab) => {
    tab.addEventListener("click", (e) => {
      e.preventDefault();
      const contents = document.querySelectorAll(".tab-content");
      contents.forEach((content) => {
        content.classList.remove("selected");
      });
      const tabName = tab.getAttribute("data-tab");
      const content = document.getElementById(tabName);
      content.classList.add("selected");
    });
  });
}

initTabs();
