class SummariesController < ApplicationController
  def create

  	 @post = Post.find(params[:post_id])
  	 @summary = @post.build_summary(params.require(:summary).permit(:summary))
 if @summary.save
      flash[:notice] = "Summary was saved."
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "There was an error saving the post. Please try again."
      render :new
    end
  end
def new
	@post = Post.find(params[:post_id])
	@summary = Summary.new
end
  def show
  	@summary = Summary.find(params[:id])
  end
end
