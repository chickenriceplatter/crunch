class CreateMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
    	t.references :season
    	t.references :team

      t.timestamps
    end
  end
end
