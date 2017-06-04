class Choice < ActiveRecord::Base
  belongs_to :campaign
  has_many :votes

  def counted_votes
    votes.where(is_valid: true).count
  end
end
