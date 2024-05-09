// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

let chevronHidden = null;
let chevronVisible = null;

const findChevronHidden = function(parentMenu) {
  for (let i = 0; i < parentMenu.children.length; i++) {
    if (parentMenu.children[i].classList.contains('chevron') && parentMenu.children[i].classList.contains('hidden')) {
      chevronHidden = parentMenu.children[i];
      break;
    }
  }
}

const findChevronVisible = function(parentMenu) {
  for (let i = 0; i < parentMenu.children.length; i++) {
    if (parentMenu.children[i].classList.contains('chevron') && parentMenu.children[i].classList.contains('hidden') === false) {
      chevronVisible = parentMenu.children[i];
      break;
    }
  }
}

const changeChevron = function(parentMenu) {
  findChevronHidden(parentMenu);
  findChevronVisible(parentMenu);
  chevronHidden.classList.remove('hidden');
  chevronVisible.classList.add('hidden');
}

export const subMenuAccordion = function(e) {
  const parentMenu = e.currentTarget
  const subMenu = parentMenu.nextElementSibling;

  if (parentMenu.getAttribute('aria-expanded') === 'false') {
    subMenu.style.display = 'none';
    parentMenu.setAttribute('aria-expanded', 'true');
  } else {
    subMenu.style.display = 'block';
    parentMenu.setAttribute('aria-expanded', 'false');
  }

  changeChevron(parentMenu);
}

let sideNavOpeHidden = null;
let sideNavOpeVisible = null;

const findSideNavOpeHidden = function(sideNavOpeButton) {
  for (let i = 0; i < sideNavOpeButton.children.length; i++) {
    if (sideNavOpeButton.children[i].classList.contains('sidenav-ope') && sideNavOpeButton.children[i].classList.contains('hidden')) {
      sideNavOpeHidden = sideNavOpeButton.children[i];
      break;
    }
  }
}

const findSideNavOpeVisible = function(sideNavOpeButton) {
  for (let i = 0; i < sideNavOpeButton.children.length; i++) {
    if (sideNavOpeButton.children[i].classList.contains('sidenav-ope') && sideNavOpeButton.children[i].classList.contains('hidden') === false) {
      sideNavOpeVisible = sideNavOpeButton.children[i];
      break;
    }
  }
}

const changeSideNavOpeButton = function(sideNavOpeButton) {
  findSideNavOpeHidden(sideNavOpeButton);
  findSideNavOpeVisible(sideNavOpeButton);
  sideNavOpeHidden.classList.remove('hidden');
  sideNavOpeVisible.classList.add('hidden');
}

export const sideNavAccordion = function(e) {
  const sideNavOpeButton = e.currentTarget;
  const sideNav = document.getElementById('side-nav');

  if (sideNav.getAttribute('aria-expanded') === 'false') {
    sideNav.classList.remove('hidden');
    sideNav.classList.add('flex');
    sideNav.setAttribute('aria-expanded', 'true');
  } else {
    sideNav.classList.add('hidden');
    sideNav.classList.remove('flex');
    sideNav.setAttribute('aria-expanded', 'false');
  }

  changeSideNavOpeButton(sideNavOpeButton);
}
