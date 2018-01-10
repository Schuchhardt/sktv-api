class AddReleaseDateToEvents < ActiveRecord::Migration
  def change
    add_column :events, :release_date, :date
  end
end
