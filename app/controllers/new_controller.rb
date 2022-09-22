class NewController < ApplicationController
  def new
     @post_image = PostImage.new
  end  
end
