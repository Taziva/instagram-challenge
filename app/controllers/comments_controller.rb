class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to :back
    else
      flash[:notice] = "Comment not sent. Please try again"
      render root_path
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    flash[:notice] = "Comment deleted :("
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:thoughts)
  end
end
