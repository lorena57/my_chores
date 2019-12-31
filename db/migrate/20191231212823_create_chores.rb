class CreateChores < ActiveRecord::Migration[5.2]

  def change
    create_table :chores do |t|
      t.string :task
      t.integer :user_id
    end
  end
  
end
