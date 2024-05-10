import { player } from 'controllers/iframe';

const init = function() {
  const sceneBtns = document.querySelectorAll('#favorite_scenes button');
  sceneBtns.forEach(function(scenebtn) {
    scenebtn.addEventListener('click', function(e) {
      player.seekTo(e.currentTarget.dataset.seekto);
      player.playVideo();
    });
  });
}
export default init;
