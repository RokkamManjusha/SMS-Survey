class AddCampaignIdToChoices < ActiveRecord::Migration
  def change
  	add_reference :choices, :campaign, index: true, foreign_key: true
  end
end
