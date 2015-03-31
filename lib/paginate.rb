=begin
module WillPaginate


 def paginate(per_page, &block)
 page = 0
  Resource.limit(per_page).offset(page * per_page)

   
 end

end
=end