# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  description    :string(255)
#  artist_id      :integer
#  status         :string(255)
#  note           :text
#  customer_email :string(255)
#  customer_first :string(255)
#  customer_last  :string(255)
#

class Item < ActiveRecord::Base

	validates :name, :description, :customer_email, :customer_first, :customer_last, presence: true

	belongs_to :artist

	before_create :set_starting_status

	STATUSES = [:design, :build, :ship]

	def customer_full_name
		"#{customer_first} #{customer_last}"
	end

	def set_starting_status
		status = STATUSES.first
	end
		

end
