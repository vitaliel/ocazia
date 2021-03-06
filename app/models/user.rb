class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable,
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  enum role: %i[user office admin]
  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email
  after_initialize :set_default_role, if: :new_record?

  belongs_to :function

  def set_default_role
    self.role ||= :user
  end
end
