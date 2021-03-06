class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show]
  def index
    if params[:search] != nil && params[:search] != ''
      #部分検索かつ複数検索
      search = params[:search]
      @posts = Post.where("comment LIKE ? OR title LIKE ?", "%#{search}%", "%#{search}%")
    else
      @posts = Post.all
    end
  end

  def new
        @post = Post.new
      end
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        #tag_list = params[:post][:tag_ids].split(',')
        if @post.save
         # @post.save_tags(tag_list)
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end
    def show
      @post = Post.find(params[:id])
      @replies = @post.replies
      @reply = Reply.new
    end

    def destroy
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to action: :index
    end
    
     private
      def post_params
        params.require(:post).permit(:comment, :title, :picture, :states)
      end
end
