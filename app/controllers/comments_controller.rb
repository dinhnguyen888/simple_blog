class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog_post

  def create
    comment = Comment.build_from(@blog_post, current_user.id, comment_params[:body])
    
    if comment.save
      redirect_to blog_post_path(@blog_post), notice: 'Comment was successfully created.'
    else
      redirect_to blog_post_path(@blog_post), alert: 'Error creating comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_blog_post
    @blog_post = BlogPost.find(params[:blog_post_id])
  end
end