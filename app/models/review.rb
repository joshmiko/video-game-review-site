class Review < ActiveRecord::Base
  belongs_to :user, optional: true
  belongs_to :game

  has_many :users

  validates_presence_of :user


end
