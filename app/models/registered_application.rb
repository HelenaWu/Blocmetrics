class RegisteredApplication < ActiveRecord::Base
  validates_uniqueness_of :URL, :name
  validates_presence_of :URL, :name
  
  belongs_to :user
  has_many :events, dependent: :destroy
end
