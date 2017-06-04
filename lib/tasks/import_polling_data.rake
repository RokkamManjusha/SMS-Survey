require_relative 'common_utils'

namespace :import_sms_polling do
  desc "Import voting details from txt file"
  task from_sms_poll: :environment do
    file_path = ENV['file_path'] or raise 'No file specified'
    File.open(file_path).each do |line|
      sms = Sms.new(line.mb_chars.to_s.split(' ').take(5))
      if sms.valid?
        sms.save
      end
    end
  end
end