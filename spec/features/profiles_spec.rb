require 'rails_helper'

      include Warden::Test::Helpers
      Warden.test_mode!

  describe "Visiting profiles" do

    include TestFactories

    before do
      @user = authenticated_user
        @post = associated_post(user: @user)
        @comment = Comment.new(user: @user, body: "A Comment")
        allow(@comment).to receive(:send_favorite_emails)
        @comment.save
    end

    describe "not signed in" do

      it "shows profile" do
        visit user_path(@user)
        expect(current_path).to eq(user_path(@user))

          expect( page ).to have_content(@user.name)
          expect( page ).to have_content(@post.title)
          expect( page ).to have_content(@comment.body)
      end
    end

    describe "signed in prior" do

    before do
      login_as(@user, :scope => :user)

    it "shows profile" do
      visit user_path(@user)
      expect(curretn_path).to eq(user_path(@user))

        expect( page ).to have_content(@user.name)
        expect( page ).to have_content(@user.title)
        expect( page ).to have_content(@comment.body)
      end
    end
  end
end