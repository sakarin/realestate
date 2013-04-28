Role.all.each do |r|
  r.destroy
end
User.all.each do |u|
  u.destroy
end