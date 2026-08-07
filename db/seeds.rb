# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

user1 = User.find_or_create_by!(email_address: "user1@example.com") do |user|
  user.name = "アオイ"
  user.password = "password"
  user.password_confirmation = "password"
end

user2 = User.find_or_create_by!(email_address: "user2@example.com") do |user|
  user.name = "ハル"
  user.password = "password"
  user.password_confirmation = "password"
end

user3 = User.find_or_create_by!(email_address: "user3@example.com") do |user|
  user.name = "アキ"
  user.password = "password"
  user.password_confirmation = "password"
end

Post.find_or_create_by!(title: "ほしの森で星空リセット") do |post|
  post.location_name = "ほしの森公園"
  post.address = "架空県架空市1-1"
  post.body = "静かな森で夜空を眺めてリフレッシュできました。"
  post.user = user1
end

Post.find_or_create_by!(title: "ゆめみ温泉で癒やし旅") do |post|
  post.location_name = "ゆめみ温泉"
  post.address = "架空県架空市2-2"
  post.body = "川のせせらぎを聞きながらの露天風呂が最高でした。"
  post.user = user2
end

Post.find_or_create_by!(title: "風音の丘からの絶景") do |post|
  post.location_name = "風音の丘"
  post.address = "架空県架空市3-3"
  post.body = "見渡す限りの緑と爽やかな風を満喫しました。"
  post.user = user3
end