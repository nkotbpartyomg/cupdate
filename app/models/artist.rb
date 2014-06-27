# == Schema Information
#
# Table name: artists
#
#  id              :integer          not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  company_name    :string(255)
#

class Artist < ActiveRecord::Base

	validates :first_name, :last_name, :password_digest, presence: true
	validates :email, presence: true, uniqueness: true

	has_many :items, dependent: :destroy
	has_secure_password

	def full_name
		"#{first_name} #{last_name}"
	end

end
