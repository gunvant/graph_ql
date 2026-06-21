# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

User.find_or_create_by!(email: "alice@example.com") do |user|
  user.name = "Alice Johnson"
  user.phone = "111-1111"
end

User.find_or_create_by!(email: "bob@example.com") do |user|
  user.name = "Bob Smith"
  user.phone = "222-2222"
end

User.find_or_create_by!(email: "alice.b@example.com") do |user|
  user.name = "Alice Brown"
  user.phone = "333-3333"
end

users = User.all

users.find { |u| u.email == "alice@example.com" }&.participations&.find_or_create_by!(start_date: "2025-02-01") do |participation|
  participation.enrollment_date = "2025-01-10"
  participation.status = "active"
  participation.end_date = "2025-12-31"
end

users.find { |u| u.email == "alice@example.com" }&.participations&.find_or_create_by!(start_date: "2026-02-01") do |participation|
  participation.enrollment_date = "2026-01-10"
  participation.status = "completed"
  participation.end_date = "2026-06-30"
end

users.find { |u| u.email == "bob@example.com" }&.participations&.find_or_create_by!(start_date: "2024-12-01") do |participation|
  participation.enrollment_date = "2024-11-05"
  participation.status = "pending"
end

users.find { |u| u.email == "alice.b@example.com" }&.participations&.find_or_create_by!(start_date: "2026-03-15") do |participation|
  participation.enrollment_date = "2026-03-05"
  participation.status = "active"
end
