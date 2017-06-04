class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.datetime :vote_at
      t.boolean :is_valid
      
      t.timestamps null: false
    end
  end
end
