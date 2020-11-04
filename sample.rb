chars = "I love apple, banana and grape"

5.times do
  chars = chars.sub("a", "@")
end

p chars