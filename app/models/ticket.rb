class Ticket < ApplicationRecord

	belongs_to :customer
	validates :title, presence: true
validates :description, presence: true

end
