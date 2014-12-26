class Admin::PostsController < Admin::AdminController
  def index
    @posts = Post.order("created_at DESC").paginate :page => params[:page], :per_page => 10
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.valid?
      @post.user = current_user
      flash[:notice] = "Post succesfully created"
      @post.save
      redirect_to admin_posts_path
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      redirect_to :back
    end
  end

  def edit
    @post = Post.find params[:id]
  end

  def update
    @post = Post.find params[:id]
    @post.assign_attributes post_params
    if @post.valid?
      @post.save
      flash[:notice] = "Post succesfully updated"
      redirect_to admin_posts_path
    else
      flash[:error] = @post.errors.full_messages.join(", ")
      redirect_to :back
    end
  end

  def show
    @post = Post.find params[:id]
  end

  def destroy
    post = Post.find params[:id]
    post.destroy
    redirect_to admin_posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :type, :slideshare_url)
  end
end
