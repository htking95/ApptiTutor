class AddReviewsToRates < ActiveRecord::Migration
  def change
    add_column :rates, :review, :string
  end
end
