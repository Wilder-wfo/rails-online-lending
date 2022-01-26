class Lend < ApplicationRecord
  belongs_to :lender
  belongs_to :borrower
end
