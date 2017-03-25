class CreateTodos < ActiveRecord::Migration[5.0]
  def up
    create_table :todos do |t|
      t.string :name
      t.text :description
    end
  end
  
  def down
    drop_table :todos
  end
end
