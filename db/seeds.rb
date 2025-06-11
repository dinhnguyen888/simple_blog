# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Create admin user
admin = User.where(email: "nguyenphucdinh89@gmail.com").first_or_initialize
admin.update!(
  password: "password123",
  password_confirmation: "password123",
  role: "admin"
)

# Create regular user
user = User.where(email: "user@example.com").first_or_initialize
user.update!(
  password: "password123",
  password_confirmation: "password123",
  role: "user"
)
user = User.where(email: "admin@admin.com").first_or_initialize
user.update!(
  password: "admin@123",
  password_confirmation: "admin@123",
  role: "admin"
)

100.times do |i|
  blog_post = BlogPost.where(title: "Blog Post #{i}").first_or_initialize
  blog_post.update!(body: "Hello world", published_at: Time.current)
end