FactoryBot.define do
    factory :book do
        title { "The factory book title" }
        genre { "The factory book genre" }
        num_pages { 100 }
        author { FactoryBot.create(:author) }
    end
end