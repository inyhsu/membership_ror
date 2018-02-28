class User < ActiveRecord::Base
  has_secure_password
  has_many :joins, dependent: :destroy
  has_many :groups, through: :joins

  before_save :downcase
  
  validates :first_name, :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+.)+[^@\s]+\z/

  def downcase
    self.email.downcase!
  end
end
