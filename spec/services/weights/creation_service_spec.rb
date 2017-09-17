require 'rails_helper'

module Weights
  RSpec.describe CreationService do
    it_behaves_like "a creation base service", :weight
  end
end
