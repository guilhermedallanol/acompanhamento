require 'rails_helper'

module Perimeters
  RSpec.describe CreationService do
    it_behaves_like "a wizard creation base service", :perimeter
  end
end
