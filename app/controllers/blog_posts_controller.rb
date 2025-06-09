class BlogPostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @blog_posts = BlogPost.all
  end

  def show
    @blog_posts = BlogPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end
  def new
    if user_signed_in?
      @blog_post = BlogPost.new
    else
      redirect_to root_path, alert: 'You must be signed in to create a blog post.'
    end
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post, notice: 'Blog post was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
  
  end

  def update
    @blog_post = BlogPost.find(params[:id])
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: 'Blog post was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post = BlogPost.find(params[:id])
    @blog_post.destroy
    redirect_to root_path notice: 'Blog post was successfully deleted.'
  rescue ActiveRecord::RecordNotFound
    redirect_to blog_posts_path, alert: 'Blog post not found.'
  rescue StandardError => e
    redirect_to blog_posts_path, alert: "An error occurred: #{e.message}"
  end


  private
  def blog_post_params
    params.require(:blog_post).permit(:title, :body)
  rescue ActionController::ParameterMissing
    redirect_to new_blog_post_path, alert: 'Missing required parameters.'
  rescue ActionController::UnpermittedParameters => e
    redirect_to new_blog_post_path, alert: "Unpermitted parameters: #{e.params.join(', ')}"
  rescue StandardError => e
    redirect_to new_blog_post_path, alert: "An error occurred: #{e.message}"
  
  
  end
end

# Option 2: use before_action to DRY up the code
# class BlogPostsController < ApplicationController
#   before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] #or except: [:index, :show]

#   before_action :set_blog_post, except: [:index, :new, :create] #or only: [:show, :edit, :update, :destroy]

#   def index
#     @blog_posts = BlogPost.all
#   end

#   def show
#   end

#   def new
#     @blog_post = BlogPost.new
#   end

#   def create
#     @blog_post = BlogPost.new(blog_post_params)
#     if @blog_post.save
#       redirect_to @blog_post
#     else
#       render :new, status: :unprocessable_entity
#     end
#   end

#   def edit
#   end

#   def update
#     if @blog_post.update(blog_post_params)
#       redirect_to @blog_post
#     else
#       render :edit, status: :unprocessable_entity
#     end
#   end

#   def destroy
#     @blog_post.destroy
#     redirect_to root_path
#   end

#   private

#   def blog_post_params
#     params.require(:blog_post).permit(:title, :body)
#   end

#   def set_blog_post
#     @blog_post = BlogPost.find(params[:id])
#   rescue ActiveRecord::RecordNotFound
#     redirect_to root_path
#   end

#   def authenticate_user!
#     redirect_to new_user_session_path, alert: 'You must be signed in to perform this action.' unless user_signed_in?
#   end
# end
