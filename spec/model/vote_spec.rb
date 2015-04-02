describe Vote do
	before do
		@post = Post.create(title: 'post-title', body: 'post body')
		3.times { @post.votes.create(value: 1)}
		2.times { @post.votes.create(value: -1)}
	end
  describe "validations" do
  	it "checks to see if a vote has been cast" do
  		expect( @post.up_vote || @post.down_vote).to eq(!nil)
  	end
  end
    describe "value validation" do
      it "only allows -1 or 1 as values" do
      	expect (@post.up_vote).to eq(1) || (@post.down_vote).to eq(-1)
     end
   end
 end
