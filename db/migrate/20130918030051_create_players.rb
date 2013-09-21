class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
    	t.string :first_name
    	t.string :last_name
      t.string :full_name
    	t.integer :height
    	t.integer :weight
   		t.date		:dob
   		t.string 	:college

      t.timestamps
    end
  end
end
