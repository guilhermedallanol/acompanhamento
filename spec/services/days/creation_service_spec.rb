require 'rails_helper'

module Days
  RSpec.describe CreationService do
    it_behaves_like "a creation base service", :day
  end
end
