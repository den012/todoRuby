class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :content
      t.boolean :completed
      t.references :todo_list, null: false, foreign_key: true
      t.text :notes

      t.timestamps
    end
  end
end
