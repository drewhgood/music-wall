class AddRatings < ActiveRecord::Migration
  
  def change
    create_table :ratings do |t|
      t.string :song_id
      t.string :user_id
      t.timestamps
    end

  end
end
