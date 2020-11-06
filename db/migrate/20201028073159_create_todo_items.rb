class CreateTodoItems < ActiveRecord::Migration[6.0]
  def change
    create_table :todo_items do |t|
      t.string :description
      t.boolean :completed
      t.datetime :completed_at
      t.integer :position
      t.references :todo_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
