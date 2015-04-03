class FavoriteMailer < ApplicationMailer
	default from: 'xgicmt@gmail.com'

	def new_comment(user, post, comment)

		#new Headers
		headers["Message-ID"] = "<comments/#{comment.id}@christhompson-bloccit.herokuapp.com>"
		headers["In-Reply-To"] = "<post/#{post.id}@christhompson-bloccit.herokuapp.com>"
		headers["References"] = "<post/#{post.id}@christhompson-bloccit.herokuapp.com>"
		
		@user = user
		@post = post
		@comment = comment

		mail(to: user.email, subject: "New comment on #{post.title}")
	end
end