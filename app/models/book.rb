class Book < ApplicationRecord
    belongs_to :author
    validates_associated :author
    validates :title, presence: true
    validates :genre, presence: true
    validates :num_pages, :numericality => { greater_than: 0 }, presence: true
end
