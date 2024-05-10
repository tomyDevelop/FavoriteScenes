const setupFlashMessage = function(flashMessage) {
  setTimeout(function() {
    flashMessage.style.opacity = 0;
    setTimeout(function() {
      flashMessage.remove();
    }, 500);
  }, 3000);
}
export default setupFlashMessage;
