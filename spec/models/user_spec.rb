require 'rails_helper'


	describe User do
	  include TestFactories
    
      before do 
        @post= associated_post
        @user = authenticated_user
      end
	describe "#favorited(post)" do
		
	  xit "returns 'nil' if the user has not favorited the post" do
	  	#expect(@user.email_favorites).to eq(nil)
	  	expect(@user.favorites.find_by_post_id(@post)).to eq(nil)
	  end

	  xit "returns the appropriate favorite if it exists" do 
	  	expect().to eq(post_id)
	  end

	  xit "returns 'nil' if the user has favorited another post" do
	  end

	end
end