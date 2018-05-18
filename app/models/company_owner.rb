class CompanyOwner < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :companies, dependent: :delete_all
  validates :phone, presence: true

  def info
    "#{phone} (#{email})"
  end
end
