require 'rails_helper'
require File.join(Rails.root, 'lib', 'tasks', 'common_utils.rb')

describe Sms do
  let(:sms_txt) { %w(VOTE 1168041915 Campaign:ssss_uk_01B Validity:during Choice:Tupele) }
  subject(:sms_txt) { Sms.new sms_txt }

  describe 'check sms keys' do

    it 'returns false when given an invalid Campaign key' do
      invalid_campaign_key = %w(VOTE 1168041915 Campign:ssss_uk_01B Validity:during Choice:Tupele)
      invalid_sms_txt = Sms.new invalid_campaign_key
      expect(invalid_sms_txt.valid?).to be false
    end

    it 'returns false when given an invalid Validity key' do
      invalid_validity_key = %w(VOTE 1168041915 Campaign:ssss_uk_01B Vality: Choice:Tupele)
      invalid_sms_txt = Sms.new invalid_validity_key
      expect(invalid_sms_txt.valid?).to be false
    end

    it 'returns false when given an invalid Choice key' do
      invalid_choice_key = %w(VOTE 1168041915 Campaign:ssss_uk_01B Validity:during Coice:Tupele)
      invalid_sms_txt = Sms.new invalid_choice_key
      expect(invalid_sms_txt.valid?).to be false
    end

    it 'returns false when given an empty Choice value' do
      invalid_choice_value = %w(VOTE 1168041915 Campaign:ssss_uk_01B Validity:during Choice:)
      invalid_sms_txt = Sms.new invalid_choice_value
      expect(invalid_sms_txt.valid?).to be false
    end
  end
end
