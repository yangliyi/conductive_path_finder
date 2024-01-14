class CreateGrids < ActiveRecord::Migration[7.0]
  def change
    create_table :grids do |t|
      t.text :input
      t.json :result

      t.timestamps
    end
  end
end
