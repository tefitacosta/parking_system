class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :vehicles

  validates :first_name, format: { with: /\A[a-zA-Z]+\z/,
    #message: "Only allows letters"
  }

  validates :last_name, format: { with: /\A[a-zA-Z]+\z/,
      #message: "Only allows letters"
    }

  validates :email, presence: true, uniqueness: true, format:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, length: { maximum: 254 }

  validates_date :birthdate, :on_or_before => lambda { Date.current }

  before_save :is_admin

  private
  def is_admin
    is_admin = false
  end

end
