require 'rails_helper'

module DailyActivities
  RSpec.describe CreationService do
    it_behaves_like "a creation base service", :daily_activity
  end
end
