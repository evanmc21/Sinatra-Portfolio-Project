class CreateSquads < ActiveRecord::Migration
  def change
    create_table :squads do |t|
      t.string :name
      t.string :lead_singer
      t.string :back_up_singer_1
      t.string :back_up_singer_2
      t.integer :user_id
    end
  end
end
