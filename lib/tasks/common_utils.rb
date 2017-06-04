class Sms
  def initialize(sms)
    @sms = sms
  end

  def valid?
    return false unless valid_sms_key? && valid_campaign? && valid_validity? && valid_choice?
    true
  end

  def save
    campaign = Campaign.where(name: campaign_name).first_or_create
    choice = campaign.choices.where(name: choice_name).first_or_create
    choice.votes.create(is_valid: valid_vote?, vote_at: vote_at)
  end

  private

  attr_reader :sms

  def valid_sms_key?
    sms[0] == 'VOTE'
  end

  def valid_campaign?
    sms[2][0, 9] == 'Campaign:'
  end

  def valid_validity?
    sms[3][0, 9] == 'Validity:'
  end

  def valid_choice?
    sms[4][0, 7] == 'Choice:' && sms[4][7..-1] != ''
  end

  def valid_vote?
    sms[3][9..-1] == 'during'
  end

  def campaign_name
    sms[2][9..-1]
  end

  def choice_name
    sms[4][7..-1]
  end

  def vote_at
    Time.at(sms[1].to_i)
  end
end
