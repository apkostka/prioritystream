class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.string :job
      t.integer :estimate
      t.integer :user_id
      t.integer :worker_id
      t.timestamp :created
      t.integer :priority

      t.timestamps
    end
  end
end
