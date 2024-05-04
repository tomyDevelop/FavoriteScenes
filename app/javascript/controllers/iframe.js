const init = function() {
 const scriptTag = document.createElement('script');
 scriptTag.src = "https://www.youtube.com/iframe_api";
 const firstScriptTag = document.getElementsByTagName('script')[0];
 firstScriptTag.parentNode.insertBefore(scriptTag, firstScriptTag);

 let player;
 window.onYouTubeIframeAPIReady = function() {
   const videoId = document.getElementById('player').dataset.videoId;
   player = new YT.Player('player', {
     height: 'auto',
     videoId: videoId 
   });
 }

  const sceneBtns = document.querySelectorAll('#favorite_scenes button');

  sceneBtns.forEach(function(scenebtn) {
    scenebtn.addEventListener('click', function(e) {
      player.seekTo(e.currentTarget.dataset.seekto);
      player.playVideo();
    });
  });
}

export default init;
