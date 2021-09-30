class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :discussions, dependent: :destroy
  has_many :comments, dependent: :destroy


  def owns_discussion?(discussion)
    id == discussion.user_id
  end

  def owns_comment?(comment)
    id == comment.user_id
  end
end
