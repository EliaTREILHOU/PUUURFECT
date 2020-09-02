class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
  has_one_attached :avatar
=======


>>>>>>> a1c84cb0004363d2004b5a7356b833f4c0574bac
end
