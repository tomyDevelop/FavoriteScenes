const init = function() {
  const tooltipTargetSceneCollectionAddHeading = document.getElementById('tooltip_target-scene_collection_add_heading');
  const tooltipTargetVideoId = document.getElementById('tooltip_target-video_id');
  const tooltipTargetShortDescription = document.getElementById('tooltip_target-short_description');
  const tooltipTargetCategory = document.getElementById('tooltip_target-category');

  const tooltipSceneCollectionAddHeading = document.getElementById('tooltip-scene_collection_add_heading');
  const tooltipVideoId = document.getElementById('tooltip-video_id');
  const tooltipShortDescription = document.getElementById('tooltip-short_description');
  const tooltipCategory = document.getElementById('tooltip-category');

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

  tooltipAdd(tooltipTargetSceneCollectionAddHeading, tooltipSceneCollectionAddHeading);
  tooltipRemove(tooltipTargetSceneCollectionAddHeading, tooltipSceneCollectionAddHeading);

  tooltipAdd(tooltipTargetVideoId, tooltipVideoId);
  tooltipRemove(tooltipTargetVideoId, tooltipVideoId);

  tooltipAdd(tooltipTargetShortDescription, tooltipShortDescription);
  tooltipRemove(tooltipTargetShortDescription, tooltipShortDescription);

  tooltipAdd(tooltipTargetCategory, tooltipCategory);
  tooltipRemove(tooltipTargetCategory, tooltipCategory);

  const tourDisplayBtn = document.getElementById('tour-display');
  const tourHideBtn = document.getElementById('tour-hide');

  tourDisplayBtn.addEventListener('click', function() {
    tooltipSceneCollectionAddHeading.classList.remove('hidden');
    tooltipVideoId.classList.remove('hidden');
    tooltipShortDescription.classList.remove('hidden');
    tooltipCategory.classList.remove('hidden');

    tooltipSceneCollectionAddHeading.classList.add('tour-display');
    tooltipVideoId.classList.add('tour-display');
    tooltipShortDescription.classList.add('tour-display');
    tooltipCategory.classList.add('tour-display');

    tourDisplayBtn.classList.add('hidden');
    tourHideBtn.classList.remove('hidden');
  });

  tourHideBtn.addEventListener('click', function() {
    tooltipSceneCollectionAddHeading.classList.add('hidden');
    tooltipVideoId.classList.add('hidden');
    tooltipShortDescription.classList.add('hidden');
    tooltipCategory.classList.add('hidden');

    tooltipSceneCollectionAddHeading.classList.remove('tour-display');
    tooltipVideoId.classList.remove('tour-display');
    tooltipShortDescription.classList.remove('tour-display');
    tooltipCategory.classList.remove('tour-display');

    tourDisplayBtn.classList.remove('hidden');
    tourHideBtn.classList.add('hidden');
  });

}
export default init;
