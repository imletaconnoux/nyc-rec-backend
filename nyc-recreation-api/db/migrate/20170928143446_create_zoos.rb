class CreateZoos < ActiveRecord::Migration[5.1]
  def change
    create_table :zoos do |t|
      t.string :Prop_ID
      t.string :Name
      t.string :Location
      t.string :Phone_Num

      t.timestamps
    end
  end
end
