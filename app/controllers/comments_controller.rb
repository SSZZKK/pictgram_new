class CommentsController < ApplicationController
    def new
      @comment = Comment.new
      @comment.topic_id = params[:topic_id]
      @comment.user_id = current_user.id
    end

  def create
        @comment = current_user.comments.new(comment_params)

        if @comment.save
            redirect_to topics_path, success: 'コメントを投稿しました'
        else
            flash.now[:danger] = 'コメント投稿に失敗しました'
            render :new
        end
    end
    
    private
    def comment_params
        params.require(:comment).permit( :user_id, :topic_id, :body)
    end
end
