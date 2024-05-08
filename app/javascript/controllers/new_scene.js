const init = function() {
  const tooltipTargetSceneSeconds = document.getElementById('tooltip_target-scene-seconds');
  const tooltipTargetHighlight = document.getElementById('tooltip_target-highlight');

  const tooltipSceneSeconds = document.getElementById('tooltip-scene-seconds');
  const tooltipHighlight = document.getElementById('tooltip-highlight');

  const tooltipAdd = function(target, content) {
    target.addEventListener('mouseover', function () {
      if (!content.classList.contains('tour-display')) {
        content.classList.remove('hidden');
      }
    });
  }

  const tooltipRemove = function(target, content) {
    target.addEventListener('mouseout', function () {
      if (!content.classList.contains('tour-display')) {
        content.classList.add('hidden');
      }
    });
  }

  tooltipAdd(tooltipTargetSceneSeconds, tooltipSceneSeconds);
  tooltipRemove(tooltipTargetSceneSeconds, tooltipSceneSeconds);

  tooltipAdd(tooltipTargetHighlight, tooltipHighlight);
  tooltipRemove(tooltipTargetHighlight, tooltipHighlight);

  const tourDisplayBtn = document.getElementById('tour-scene_add-display');
  const tourHideBtn = document.getElementById('tour-scene_add-hide');

  tourDisplayBtn.addEventListener('click', function() {
    tooltipSceneSeconds.classList.remove('hidden');
    tooltipHighlight.classList.remove('hidden');

    tooltipSceneSeconds.classList.add('tour-display');
    tooltipHighlight.classList.add('tour-display');

    tourDisplayBtn.classList.add('hidden');
    tourHideBtn.classList.remove('hidden');
  });

  tourHideBtn.addEventListener('click', function() {
    tooltipSceneSeconds.classList.add('hidden');
    tooltipHighlight.classList.add('hidden');

    tooltipSceneSeconds.classList.remove('tour-display');
    tooltipHighlight.classList.remove('tour-display');

    tourDisplayBtn.classList.remove('hidden');
    tourHideBtn.classList.add('hidden');
  });

}
export default init;
