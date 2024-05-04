require 'google/apis/youtube_v3'

class SceneCollectionsController < ApplicationController
  skip_before_action :require_login, only: [:show, :index]

  def new
    @scene_collection = SceneCollection.new
  end

  def create
    if params[:commit] == "動画チェック"
      @scene_collection = SceneCollection.new(set_video_id)
      video_info = get_video_info(@scene_collection.video_id)
      if video_info
        @scene_collection.video_title = video_info.snippet.title
        @scene_collection.channel_name = video_info.snippet.channel_title
        @scene_collection.video_thumbnail_url = video_info.snippet.thumbnails.default.url
      else
        flash.now[:alert] = t 'scene_collections.form.msg.api_failed'
      end
      render :new, status: :unprocessable_entity
    else
      @scene_collection = current_user.scene_collections.build(scene_collection_params)
      if @scene_collection.save
        redirect_to edit_scene_collection_path(@scene_collection.id), notice: t('scene_collections.form.msg.create_success')
      else
        flash.now[:alert] = t 'scene_collections.form.msg.create_failed'
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    @scene_collection = SceneCollection.find(params[:id])
    @scenes = @scene_collection.scenes.order('seconds')
    @scene = @scene_collection.scenes.build
    authorize @scene_collection
  end

  def update
    @scene_collection = SceneCollection.find(params[:id])
    @scenes = @scene_collection.scenes.order('seconds')
    authorize @scene_collection
    if @scene_collection.update(scene_collection_params)
      redirect_to scene_collection_path(@scene_collection.id), notice: t('scene_collections.form.msg.update_success')
    else
      flash.now[:alert] = t 'scene_collections.form.msg.update_failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @scene_collection = SceneCollection.find(params[:id])
    @scenes = @scene_collection.scenes.order('seconds')
  end

  def index
    @q =SceneCollection.ransack(params[:q])
    @scene_collections = @q.result.order('created_at DESC')
  end

  def my_index
    @q =SceneCollection.ransack(params[:q])
    @scene_collections = @q.result.where(user_id: current_user.id).order('created_at DESC')
  end

  def destroy
    scene_collection = SceneCollection.find(params[:id])
    authorize scene_collection
    scene_collection.destroy
    redirect_to my_scene_collections_path, notice: t('scene_collections.form.msg.destroy_success'), status: :see_other
  end

  private

  def set_video_id
    params.require(:scene_collection).permit(:video_id)
  end

  def get_video_info(video_id)
    youtube = Google::Apis::YoutubeV3::YouTubeService.new
    youtube.key = ENV['YOUTUBE_API_KEY']
    response = youtube.list_videos('snippet',id: video_id)
    response.items.first
  end

  def scene_collection_params
    params.require(:scene_collection).permit(:video_id, :video_title, :channel_name, :title, :short_description, :category_id, :video_thumbnail_url)
  end
end
