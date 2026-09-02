// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "./jpostal"
document.addEventListener("turbo:load", () => {
  const menu = document.getElementById("navbarNav");
  const toggler = document.getElementById("navbar-toggler-btn");

  if (menu && toggler && window.bootstrap) {
    const bsCollapse = bootstrap.Collapse.getOrCreateInstance(menu, { toggle: false });

    bsCollapse.hide();

    toggler.onclick = (e) => {
      e.preventDefault();
      bsCollapse.toggle();
    };
  }
});