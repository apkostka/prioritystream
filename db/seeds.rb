# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create name: "Andrew", email: "apkostka@gmail.com", color: "#366355"
User.first.update_attribute(:created_at, "2013-06-20 20:34:23")
User.first.update_attribute(:updated_at, "2013-06-21 01:56:39")
User.first.update_attribute(:password_digest, "$2a$10$Av.sTbTSFQz0oc8bY/KbveOVBXj81sbI3g6oezmBJ.gD...")
User.first.update_attribute(:remember_token, "mHeoVLfqGbA0bSIpWPoe9A")
User.first.update_attribute(:admin, true)