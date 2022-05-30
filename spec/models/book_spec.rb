require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('Author') }
  end

  describe 'factory-bot' do
    let!(:factory_book) { FactoryBot.create(:book) }

    it 'should create a valid book' do
      expect(factory_book.title).to eq("The factory book title")
      expect(factory_book.genre).to eq("The factory book genre")
      expect(factory_book.num_pages).to eq(100)
      expect(factory_book.author.name).to eq("J.R.R Tolkien")
      expect(factory_book.author.age).to eq(55)
    end
  end

  describe 'validations' do
    let(:author) { Author.new(name: "John Doe") }
    subject { described_class.new(title: "Title", genre: "Genre", num_pages: 10, author: author) }

    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:genre) }
    it { should validate_presence_of(:num_pages) }
    it { should validate_numericality_of(:num_pages).is_greater_than(0) }

    context "when the author is not present" do
      let(:author) { nil }
      it 'should validate presence of associated author' do
        expect(subject).to_not be_valid
        expect(subject.errors[:author]).to include("must exist")
      end
    end

    context "when the author is invalid" do
      let(:author) { Author.new }
      it 'should validate the associated author' do
        is_expected.to_not be_valid
        expect(subject.errors[:author]).to eq(["is invalid"])
      end
    end
  end
end
