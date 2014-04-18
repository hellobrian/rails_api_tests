class API::GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def index
    goals = Goal.all
    if is_complete = params[:is_complete]
      goals = goals.where(is_complete: is_complete)
    end
    render json: goals, status: 200 

    # respond_to do |format|
    #   format.json { render json: goals, status: 200 }
    #   format.xml { render xml: goals, status: 200 } 
    # end
  end

  def show
    goal = Goal.find(params[:id])
    render json: goal, status: 200
  end

  def create
    goal = Goal.new(goal_params)
    if goal.save
      render json: goal, status: 201, location: api_goal_url(goal[:id])
    else
      render json: goal.errors, status: 422
    end
  end

  def update
    goal = Goal.find(params[:id])
    if goal.update(goal_params)
      render json: goal, status: 200
    else
      render json: goal.errors, status: 422
    end
  end

  def destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:description, :motivation, :completion_date, :is_complete)
    end
end
