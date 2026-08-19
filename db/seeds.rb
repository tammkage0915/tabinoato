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
  user.profile_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("db/fixtures/sample-user1.jpg")), 
    filename: "sample-user1.jpg"
  )
end

user2 = User.find_or_create_by!(email_address: "user2@example.com") do |user|
  user.name = "ハル"
  user.password = "password"
  user.password_confirmation = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("db/fixtures/sample-user2.jpg")), 
    filename: "sample-user2.jpg"
  )
end

user3 = User.find_or_create_by!(email_address: "user3@example.com") do |user|
  user.name = "アキ"
  user.password = "password"
  user.password_confirmation = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(
    io: File.open(Rails.root.join("db/fixtures/sample-user3.jpg")), 
    filename: "sample-user3.jpg"
  )
end

post1 = Post.find_or_create_by!(title: "ほしの森で星空リセット") do |post|
  post.location_name = "ほしの森公園"
  post.address = "架空県架空市1-1"
  post.body = "静かな森で夜空を眺めてリフレッシュできました。"
  post.user = user1
end
unless post1.images.attached?
  post1.images.attach(
    ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join("db/fixtures/sample-post1.jpg")), 
      filename: "sample-post1.jpg"
    )
  )
end

post2 = Post.find_or_create_by!(title: "ゆめみ温泉で癒やし旅") do |post|
  post.location_name = "ゆめみ温泉"
  post.address = "架空県架空市2-2"
  post.body = "川のせせらぎを聞きながらの露天風呂が最高でした。"
  post.user = user2
end
unless post2.images.attached?
  post2.images.attach(
    ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join("db/fixtures/sample-post2.jpg")), 
      filename: "sample-post2.jpg"
    )
  )
end

post3 = Post.find_or_create_by!(title: "風音の丘からの絶景") do |post|
  post.location_name = "風音の丘"
  post.address = "架空県架空市3-3"
  post.body = "見渡す限りの緑と爽やかな風を満喫しました。"
  post.user = user3
end
unless post3.images.attached?
  post3.images.attach(
    ActiveStorage::Blob.create_and_upload!(
      io: File.open(Rails.root.join("db/fixtures/sample-post3.jpg")), 
      filename: "sample-post3.jpg"
    )
  )
end