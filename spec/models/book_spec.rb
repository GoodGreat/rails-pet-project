require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('Author') }
  end
end
