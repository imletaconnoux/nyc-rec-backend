class CreateBbqs < ActiveRecord::Migration[5.1]
  def change
    create_table :bbqs do |t|
      t.string :Prop_ID
      t.string :Name
      t.string :Location

      t.timestamps
    end
  end
end
