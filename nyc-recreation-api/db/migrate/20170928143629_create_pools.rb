class CreatePools < ActiveRecord::Migration[5.1]
  def change
    create_table :pools do |t|
      t.string :Prop_ID
      t.string :Name
      t.string :Location
      t.string :Phone
      t.string :Pools_outdoor_Type
      t.string :Setting
      t.string :Size
      t.string :Accessible
      t.string :lat
      t.string :lon
      t.string :rec_center_id

      t.timestamps
    end
  end
end
