class ConductivePathService
  attr_accessor :grid

  def initialize(grid)
    @grid = grid
  end

  def find
    return { evaluation: false, conductive_paths: [] } if grid.empty?
  
    n = grid.length  # Get the number of rows in the grid.
    m = grid[0].length  # Get the number of columns in the grid.
    row_paths = []  # Initialize an array to store row conductive paths.
    col_paths = []  # Initialize an array to store column conductive paths.
  
    # Helper function to check if a cell is part of a conductive path.
    def is_conductive(x, y, grid)
      x >= 0 && x < grid.length && y >= 0 && y < grid[0].length && grid[x][y] == '1'
    end
  
    # Find row conductive paths.
    for i in 0...n
      row_path = []
      for j in 0...m
        if is_conductive(i, j, grid)
          row_path << [i, j]
        else
          if row_path.length == n
            row_paths << row_path
          end
          row_path = []
        end
      end
  
      row_paths << row_path if row_path.length == n
    end
  
    # Find column conductive paths.
    for j in 0...m
      col_path = []
      for i in 0...n
        if is_conductive(i, j, grid)
          col_path << [i, j]
        else
          if col_path.length == m
            col_paths << col_path
          end
          col_path = []
        end
      end
      col_paths << col_path if col_path.length == m
    end
  
    return { evaluation: false, conductive_paths: [] } if row_paths.empty? && col_paths.empty?
    
    conductive_paths = row_paths + col_paths
    
    conductive_path_mappings = {}
    conductive_paths.each do |path|
      path.each do |coordinates|
        conductive_path_mappings["#{coordinates[0]}-#{coordinates[1]}"] ||= true
      end
    end
    { evaluation: true, conductive_paths: conductive_paths, conductive_path_mappings: conductive_path_mappings }
  end
end