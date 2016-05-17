class TagsController < ApplicationController
  before_action :set_tag, only: [:show,:destroy]
  def index
    @tags = Tag.all
  end
  def show
  end
  def destroy
    tag = @tag.name
    @tag.taggings.destroy_all
    @tag.destroy
    flash.notice = "#{tag} tag is deleted!"
    redirect_to tags_path
  end

  private
  def set_tag
    @tag = Tag.find(params[:id])
  end
end
