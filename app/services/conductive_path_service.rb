class ConductivePathService
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def find
    return [false,[]] if grid.empty?
  
    n = grid.length
    m = grid[0].length
  
    # Create a visited array to keep track of visited cells
    visited = Array.new(n) { Array.new(m, false) }
  
    # Helper function to check if a cell is valid and contains '1'
    def is_valid(x, y, grid, visited)
      x >= 0 && x < grid.length && y >= 0 && y < grid[0].length && grid[x][y] == '1' && !visited[x][y]
    end
  
    # Helper function to check if a cell is on the top or bottom row
    def is_top_or_bottom(x, n)
      x == 0 || x == n - 1
    end
  
    # DFS function to explore connected '1' cells and return their indices
    def dfs(x, y, grid, visited, path)
      visited[x][y] = true
      path << [x, y] # Add the current cell's indices to the path
  
      # Check adjacent cells (up, down, left, right)
      dx = [-1, 1, 0, 0]
      dy = [0, 0, -1, 1]
  
      dx.length.times do |i|
        new_x = x + dx[i]
        new_y = y + dy[i]
  
        if is_valid(new_x, new_y, grid, visited)
          dfs(new_x, new_y, grid, visited, path)
        end
      end
    end
  
    # Start DFS from the top row
    top_row = 0
    bottom_row = n - 1
    conductive_path_found = false
    path = []
  
    for j in 0...m
      if grid[top_row][j] == '1' && !visited[top_row][j]
        dfs(top_row, j, grid, visited, path)
        conductive_path_found = true
      end
    end
  
    if conductive_path_found
      return [true, path]
    else
      return [false, []]
    end
  end
end
