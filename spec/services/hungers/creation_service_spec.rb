require 'rails_helper'

module Hungers
  RSpec.describe CreationService do
    it_behaves_like "a creation base service", :hunger
  end
end
