class RepliesController < ApplicationController
    before_action :authenticate_user!

    def create
      post = Post.find(params[:post_id])
      reply = post.replies.build(reply_params)
      reply.user_id = current_user.id
      if reply.save
        flash[:success] = "コメントしました"
        redirect_back(fallback_location: root_path)
      else
        flash[:success] = "コメントできませんでした"
        redirect_back(fallback_location: root_path)
      end
    end
  
    private
  
      def comment_params
        params.require(:reply).permit(:content)
      end
  
end