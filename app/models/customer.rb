class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :orders, dependent: :delete_all
  has_many :goods, dependent: :delete_all
  validates :company_phone, :mobile_phone, presence: true

  def info
    "#{first_name} #{last_name} (#{email})"
  end
end
