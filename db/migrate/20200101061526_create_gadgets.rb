class CreateGadgets < ActiveRecord::Migration[5.2]
  def change
      create_table :gadgets do |t|
        t.string :gizmo
        t.integer :chore_id
    end
  end
end
