class Campaign < ActiveRecord::Base
  has_many :choices

  def invalid_votes
    choices.inject(0) do |votes, choice|
      votes += choice.votes.where(is_valid: false).count
    end
  end
end
