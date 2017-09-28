class CreateTennis < ActiveRecord::Migration[5.1]
  def change
    create_table :tennis do |t|
      t.string :Prop_ID
      t.string :Name
      t.string :Location
      t.string :Phone
      t.string :Courts
      t.string :Indoor_Outdoor
      t.string :Tennis_Type
      t.string :Accessible
      t.string :Info
      t.string :lat
      t.string :lon

      t.timestamps
    end
  end
end
