class CommentsController < ApplicationController
 
  def create
    @post = Post.find(params[:post_id])
    @topic = @post.topic
   # @topic = Topic.find(params[:topic_id])
   # @post = @topic.posts.find(params[:post_id])
    ###############DELETED THIS TO SEE IF IT WAS NEEDED   ####################
    #@comments = @post.comments
    ###############IT DOES NOT SEEM TO BE   ########################
    @comment = current_user.comments.build(comment_params)
    @comment.post = @post
    #@comment = current_user.comments.new(comment_params)
    #@post = Post.find(params[:post_id])
    #@new_comment = Comment.new
    if @comment.save
      flash[:notice] = "Comment was saved."
      redirect_to [@topic, @post]

    else
      flash[:error] = "Comment did not save"
      redirect_to [@topic, @post]
    end
  end

  def destroy
    #@topic = Topic.find(params[:topic_id])
    @post = Post.find(params[:post_id])
    @topic = @post.topic
    @comment = @post.comments.find(params[:id])

    authorize @comment

    if @comment.destroy
      flash[:notice] = "Comment was removed."
    else
      flash[:error] = "Comment could not be deleted, Please try again."
    end

    respond_to do |format|
      format.html
      format.js
    end

  end

private

def comment_params
  params.require(:comment).permit(:body, :post_id)
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