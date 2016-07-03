class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true
  has_many :events, dependent: :destroy

  default_scope { order('updated_at ASC') }
end
