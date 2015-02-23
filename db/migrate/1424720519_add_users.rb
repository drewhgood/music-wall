class AddUsers < ActiveRecord::Migration
  def change

    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :name_first
      t.string :name_last
      t.timestamps
    end

    add_column :songs, :user_id, :integer, index: true

    
  end
end
