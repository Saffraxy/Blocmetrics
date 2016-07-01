class RegisteredApplication < ActiveRecord::Base
  belongs_to :user
  validates :user, presence: true

  default_scope { order('updated_at ASC') }
end
