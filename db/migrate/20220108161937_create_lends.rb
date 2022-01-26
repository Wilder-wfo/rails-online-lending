class CreateLends < ActiveRecord::Migration[6.0]
  def change
    create_table :lends do |t|
      t.integer :amount
      t.references :lender, foreign_key: true
      t.references :borrower, foreign_key: true

      t.timestamps
    end
  end
end
