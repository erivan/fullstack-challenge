class CreateComicVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :comic_votes do |t|
      t.integer :comic_id
      t.integer :votes

      t.timestamps
    end
  end
end
