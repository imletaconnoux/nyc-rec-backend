class CreateUserPrefs < ActiveRecord::Migration[5.1]
  def change
    create_table :user_prefs do |t|
      t.integer :user_id
      t.integer :zoo_id
      t.integer :tenni_id
      t.integer :pool_id
      t.integer :bbq_id

      t.timestamps
    end
  end
end
