class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registerable,
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  enum role: [:user, :office, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
end
