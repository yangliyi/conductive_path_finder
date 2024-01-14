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
    @grids = Grid.all
  end

  def grid_params
    params.require(:grid).permit(:input)
  end
end
