class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  has_one :driver_license, dependent: :delete
  has_one :truck
  has_many :insurance_policies
  belongs_to :company, optional: true
  has_many :orders

  def info
    "#{first_name} #{last_name} (#{phone})"
  end
end
