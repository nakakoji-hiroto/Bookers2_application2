class TagsController < ApplicationController
  def search
    @tag_word = params[:tag]
    @tags = Book.where(tag: @tag_word)
  end
end
