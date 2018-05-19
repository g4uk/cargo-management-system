class Driver < ApplicationRecord
  # Include default devise modules. Others available are:
  # :recoverable, :confirmable, :lockable, :registerable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable

  has_one :driver_license, dependent: :delete
  has_one :truck, dependent: :nullify
  has_many :insurance_policies, dependent: :delete_all
  belongs_to :company, optional: true
  has_many :orders, dependent: :nullify

  def info
    "#{first_name} #{last_name} (#{phone})"
  end
end
