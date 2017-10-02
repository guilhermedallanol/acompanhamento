require 'rails_helper'

module Weights
  RSpec.describe CreationService do
    it_behaves_like "a wizard creation base service", :weight
  end
end
