class AddDefaultValueForVotesInComicVotes < ActiveRecord::Migration[5.0]
  def change
    change_column :comic_votes, :votes, :integer, :default => 0
  end
end
