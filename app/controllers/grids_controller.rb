class GridsController < ApplicationController

  def new
    @grid = Grid.new
  end

  def create
    formatted_grid = grid_params[:input].split("\n").map{ |i| i.split('') }
    result = ConductivePathService.new(formatted_grid).find
    @grid = Grid.create(input: grid_params[:input], result: result.merge(formatted_grid: formatted_grid))

    redirect_to action: :index
  end

  def index
    @grids = Grid.order(id: :desc).page(params[:page]).per(5)
  end

  def grid_params
    params.require(:grid).permit(:input)
  end
end
