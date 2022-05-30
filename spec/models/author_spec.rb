require 'rails_helper'

RSpec.describe Author, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'factory-bot' do
    let!(:factory_author) { FactoryBot.create(:author) }

    it 'should create a valid author' do
      expect(factory_author.name).to eq("J.R.R Tolkien")
      expect(factory_author.age).to eq(55)
    end
  end
end
