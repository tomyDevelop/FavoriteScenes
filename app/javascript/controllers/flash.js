const init = function () {
  const flashMessage = document.getElementById('flash_message');
  const flashMessageBtn = document.getElementById('flash_message_button');

  flashMessageBtn.addEventListener('click', function() {
    flashMessage.classList.add('hidden');
  });
}
export default init;
