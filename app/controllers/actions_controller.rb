class ActionsController < ApplicationController


  def execute
    action = Action.find(params[:id])
    action.execute
    action.save
    redirect_to action.deck_to
  end

end
