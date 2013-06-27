class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :job
      t.integer :hours
      t.datetime :due
      t.boolean :complete
      t.integer :user_id
      t.integer :worker_id
      t.integer :priority

      t.timestamps
    end
    add_index :microposts, [:user_id, :created_at]
  end
end
