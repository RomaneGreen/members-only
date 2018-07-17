class PostsController < ApplicationController

before_action :validate_user, only: [:new, :create]



def index

@posts = Post.all
end


def new


end

def create
 user = User.find_by(remember_token: cookies[:remember_token])
post  = User.new.posts.new(body:params[:post][:body])

 post.user_id = user.id
post.save
 if post.save
 redirect_to :root
else
  render 'root'
 end
end



end
