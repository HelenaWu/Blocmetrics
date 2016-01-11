class RegisteredApplication < ActiveRecord::Base
  validates_uniqueness_of :URL
  belongs_to :user
  has_many :events, dependent: :destroy
end
