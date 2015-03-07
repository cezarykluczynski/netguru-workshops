# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Admin
admin = User.create!(email: "admin@example.com", firstname: "Admin", lastname: "Admin", password: "adminadmin", password_confirmation: "adminadmin", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:02:10", last_sign_in_at: "2015-02-06 14:02:10", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: true)

# Users
user = User.create!(email: "user@example.com", firstname: "User1", lastname: "User1", password: "useruser", password_confirmation: "useruser", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: false)
user2 = User.create!(email: "user2@example.com", firstname: "User2", lastname: "User2", password: "useruser", password_confirmation: "useruser", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: false)

User.create!([
  {email: "user3@example.com", firstname: "User3", lastname: "User3", password: "useruser", password_confirmation: "useruser", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: false},
  {email: "user4@example.com", firstname: "User4", lastname: "User4", password: "useruser", password_confirmation: "useruser", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: false},
  {email: "user5@example.com", firstname: "User5", lastname: "User5", password: "useruser", password_confirmation: "useruser", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 1, current_sign_in_at: "2015-02-06 14:03:01", last_sign_in_at: "2015-02-06 14:03:01", current_sign_in_ip: "127.0.0.1", last_sign_in_ip: "127.0.0.1", admin: false}
])

# Category for books
books = Category.create!(name: "Books", created_at: "2015-02-06 14:03:01")

# Jaws - first book
jaws = Product.create!(title: "Jaws", description: "Jaws is a 1974 novel by Peter Benchley. It tells the story of a great white shark that preys upon a small resort town and the voyage of three men to kill it.", price: 12.50, created_at: "2015-02-06 14:03:01", updated_at: "2015-02-06 15:03:01", category_id: books.id, user_id: admin.id)

# Reviews for Jaws
Review.create!([
  {content: "Love it!", rating: 5, created_at: "2015-02-07 14:03:01", updated_at: "2015-02-07 15:03:01", user_id: admin.id, product_id: jaws.id},
  {content: "Could be better.", rating: 3, created_at: "2015-02-08 14:03:01", updated_at: "2015-02-08 15:03:01", user_id: user2.id, product_id: jaws.id},
  {content: "I don't know what to think.", rating: 3, created_at: "2015-02-09 14:03:01", updated_at: "2015-02-09 15:03:01", user_id: user.id, product_id: jaws.id}
])

# Shōgun - second book
shogun = Product.create!(title: "Shōgun", description: "Shōgun is a 1975 novel by James Clavell. It is the first novel (by internal chronology) of the author's Asian Saga. A major bestseller, by 1990 the book had sold 15 million copies worldwide.", price: 6.00, created_at: "2015-02-10 14:03:01", updated_at: "2015-02-10 15:03:01", category_id: books.id, user_id: user.id)

# Reviews for Shōgun
Review.create!([
  {content: "I would recommend it.", rating: 4, created_at: "2015-02-11 14:03:01", updated_at: "2015-02-11 15:03:01", user_id: user.id, product_id: shogun.id},
  {content: "Something to read.", rating: 3, created_at: "2015-02-12 14:03:01", updated_at: "2015-02-12 15:03:01", user_id: user2.id, product_id: shogun.id},
  {content: "Kind of cool.", rating: 3, created_at: "2015-02-13 14:03:01", updated_at: "2015-02-13 15:03:01", user_id: admin.id, product_id: shogun.id}
])

# Dune - third book
dune = Product.create!(title: "Dune", description: "Dune is a 1965 epic science fiction novel by Frank Herbert. It won the Hugo Award in 1966, and the inaugural Nebula Award for Best Novel.", price: 10.99, created_at: "2015-02-14 14:03:01", updated_at: "2015-02-14 15:03:01", category_id: books.id, user_id: user.id)

# Reviews for Dune
Review.create!([
  {content: "Not for me.", rating: 2, created_at: "2015-02-15 14:03:01", updated_at: "2015-02-15 15:03:01", user_id: user.id, product_id: dune.id},
  {content: "That's the read!", rating: 5, created_at: "2015-02-16 14:03:01", updated_at: "2015-02-16 15:03:01", user_id: user2.id, product_id: dune.id},
  {content: "A nice read.", rating: 4, created_at: "2015-02-17 14:03:01", updated_at: "2015-02-17 15:03:01", user_id: admin.id, product_id: dune.id}
])