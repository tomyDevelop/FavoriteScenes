class ScenesController < ApplicationController
  def new
    @scene_collection = SceneCollection.find(params[:scene_collection_id])
    @scene = @scene_collection.scenes.build
    authorize @scene_collection
  end

  def create
    @scene_collection = SceneCollection.find(params[:scene_collection_id])
    @scene = @scene_collection.scenes.build(scene_params)
    @scenes = @scene_collection.scenes.order('seconds')
    authorize @scene_collection
    if @scene.save
      @scene = @scene_collection.scenes.build
      flash.now[:notice] = 'シーンを追加しました。'
      render :create
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @scene_collection = SceneCollection.find(params[:scene_collection_id])
    @scene = Scene.find(params[:id])
    authorize @scene
  end

  def update
    @scene_collection = SceneCollection.find(params[:scene_collection_id])
    @scene = Scene.find(params[:id])
    authorize @scene
    if @scene.update(scene_params)
      flash.now[:notice] = 'シーンを編集しました。'
      render :show
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @scene_collection = SceneCollection.find(params[:scene_collection_id])
    @scene = Scene.find(params[:id])
  end

  def index
    @scene_collection = SceneCollection.find(params[:scene_collection_id])
    @scenes = @scene_collection.scenes.order('seconds')
  end

  def destroy
    @scene = Scene.find(params[:id])
    authorize @scene
    @scene.destroy
    render turbo_stream: turbo_stream.remove(@scene)
  end

  private

  def scene_params
    params.require(:scene).permit(:seconds, :highlight)
  end
end
