class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :team_name, null: false
      t.string :affiliation, null: false
      t.boolean :work, null: false, default: false

      t.timestamps
    end
  end
end
