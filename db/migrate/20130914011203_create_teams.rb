class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
    	t.string :name
    	t.string :city

    	t.references :season

      t.timestamps
    end
  end
end
