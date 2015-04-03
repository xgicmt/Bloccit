class FavoritesController < ApplicationController
	def create
	  @post = Post.find(params[:post_id])
	  favorite = current_user.favorites.build(post: @post)
	  authorize favorite
	  if favorite.save
	  	flash[:notice] = "Successfully favorited"
	  	redirect_to [@post.topic, @post]
	  else
	  	flash[:error] = "You broke the internet, try again"
	  	redirect_to [@post.topic, @post]
	  end
	end

  def destroy
  	@post = Post.find(params[:post_id])
    favorite = current_user.favorites.find(params[:id])

    authorize favorite
      if favorite.destroy
      	flash[:notice] = "You are no longer following this post"
    	redirect_to [@post.topic, @post]
      else
    	flash[:error] = "You broke the interenet, try again"
    	redirect_to [@post.topic, @post]
      end
  end


end
