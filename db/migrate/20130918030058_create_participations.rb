class CreateParticipations < ActiveRecord::Migration
  def change
    create_table :participations do |t|
    	t.references :season
    	t.references :player

      t.timestamps
    end
  end
end
