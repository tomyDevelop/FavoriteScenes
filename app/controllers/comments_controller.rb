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

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
