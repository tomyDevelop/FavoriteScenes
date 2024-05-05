class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.scene_collection_id = params[:scene_collection_id]
    @scene_collection = SceneCollection.find(params[:scene_collection_id])
    if @comment.save
      flash.now[:notice] = t('comments.form.msg.create_success')
      render :create
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @scene_collection = SceneCollection.find(params[:scene_collection_id])
    authorize @comment
  end

  def update
    @comment = Comment.find(params[:id])
    @scene_collection = SceneCollection.find(params[:scene_collection_id])
    authorize @comment
    if @comment.update(comment_params)
      flash.now[:notice] = t('comments.form.msg.update_success')
      render :show
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.find(params[:id])
    @scene_collection = SceneCollection.find(params[:scene_collection_id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment
    @comment.destroy
    render turbo_stream: turbo_stream.remove(@comment)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
