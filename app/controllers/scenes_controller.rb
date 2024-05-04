class ScenesController < ApplicationController
  def create
    @scene_collection = SceneCollection.find(params[:scene_collection_id])
    @scene = @scene_collection.scenes.build(scene_params)
    @scenes = @scene_collection.scenes.order('seconds')
    if @scene.save
      flash.now[:notice] = 'シーンを追加しました。'
      render :index
    else
      render :index
    end
  end

  private

  def scene_params
    params.require(:scene).permit(:seconds, :highlight)
  end
end
