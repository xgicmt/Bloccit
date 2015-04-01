class CommentsController < ApplicationController
 
  def create
    @topic = Topic.find(params[:topic_id])
    @post = @topic.posts.find(params[:post_id])
    @comments = @post.comments
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post

    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "Comment did not save"
      redirect_to [@topic, @post]
    end
  end

private

def comment_params
  params.require(:comment).permit(:body, :post_id, :user_id)
end


end
=begin
class CommentsController < ApplicationController

  def create
 #   @comments = Comments.new[params(:body)]
  #  @topic = Topic.find(params[:topic_id])
    @comment = current_user.comments.new(comment_params)
    @post = Post.find(params[:post_id])
   # @user = User.find(params[:user_id])
=begin      if @comment.save
      flash[:notice] = "Post was saved."
      redirect_to [@topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      redirect_to [@topic, @post]
    end

  end

  private

    def comment_params
      params.require(:comment).permit(:body)
    end
end
=end