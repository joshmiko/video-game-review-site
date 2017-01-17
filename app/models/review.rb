class Review < ActiveRecord::Base
  belongs_to :user, optional: true
  belongs_to :game

  has_many :users
  has_many :votes

  validates_presence_of :user

  def vote_total
    total = 0
    votes.each do |vote|
      total += vote.value
    end
    total
  end
end
