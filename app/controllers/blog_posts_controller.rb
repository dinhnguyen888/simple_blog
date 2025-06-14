class BlogPostsController < ApplicationController
  include Authorization
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :require_admin!, except: [:index, :show]
  before_action :set_blog_post, except: [:index, :new, :create]

  def index
    @blog_posts = if user_signed_in? && current_user.admin?
      BlogPost.sorted
    else
      BlogPost.published.sorted
    end
    @pagy, @blog_posts = pagy(@blog_posts) 
  rescue Pagy::OverflowError
    redirect_to root_path(page: 1)
    # params[:page] = 1
    # retry
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to root_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :body, :cover_image, :published_at)
  end

  def set_blog_post
    @blog_post = if user_signed_in? && current_user.admin?
      BlogPost.find(params[:id])
    else
      BlogPost.published.find(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
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
#     @blog_post = BlogPost.published.find(params[:id])
#   rescue ActiveRecord::RecordNotFound
#     redirect_to root_path
#   end

#   def authenticate_user!
#     redirect_to new_user_session_path, alert: 'You must be signed in to perform this action.' unless user_signed_in?
#   end
# end
