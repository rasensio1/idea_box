class IdeasController < ApplicationController

  def new
    @idea = Idea.new
  end

  def create
    idea = current_user.ideas.new(idea_params)
    if idea.save
      redirect_to user_path(current_user)
    else
      flash[:errors] = "Incorrect input params"
      redirect_to new_user_idea_path(current_user)
    end
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    @idea.update(idea_params)
    redirect_to user_path(current_user)
  end

  def destroy
    @idea = Idea.find(params[:id])
    @idea.delete 
    redirect_to user_path(current_user)
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :body, :user_id, :category_id)
  end
end

