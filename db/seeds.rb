# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
authors = Author.create([ { name: "J.R.R Tolkien", age: 52 }, { name: "C.S Lewis", age: 45 } ])
Book.create([ { title: "The Lord of the Rings: The Fellowship of the Ring", genre: "Adventure", num_pages: 672, author: authors.first }, 
              { title: "The Chronicles of Narnia: ", genre: "Adventure", num_pages: 672, author: authors.last }
            ])
