class IdeasController < ApplicationController

  def new
    @idea = Idea.new
  end

  def create
    idea = Idea.new(idea_params)
    if idea.save
      redirect_to user_path(current_user)
    else
      flash[:errors] = "Incorrect input params"
      redirect_to new_idea_path
    end

  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :user_id)
  end
end

