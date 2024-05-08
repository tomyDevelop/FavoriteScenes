const init = function() {
  const tooltipTargetSceneSecondsEdit = document.getElementById('tooltip_target-scene-seconds-edit');
  const tooltipTargetHighlightEdit = document.getElementById('tooltip_target-highlight');

  const tooltipSceneSeconds = document.getElementById('tooltip-scene-seconds-edit');
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

  tooltipAdd(tooltipTargetSceneSecondsEdit, tooltipSceneSeconds);
  tooltipRemove(tooltipTargetSceneSecondsEdit, tooltipSceneSeconds);

  tooltipAdd(tooltipTargetHighlightEdit, tooltipHighlight);
  tooltipRemove(tooltipTargetHighlightEdit, tooltipHighlight);

  const tourDisplayBtn = document.getElementById('tour-scene_edit-display');
  const tourHideBtn = document.getElementById('tour-scene_edit-hide');

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
