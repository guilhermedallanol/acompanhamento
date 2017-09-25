require 'rails_helper'

module Priorities
  RSpec.describe CreationService do
    it_behaves_like "a creation base service", :priority
  end
end
