class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :firstname, :lastname, presence: true

  has_many :reviews
  has_many :products

  def admin?
    return @admin
  end

  def name
    self.firstname + " " + self.lastname
  end
end
