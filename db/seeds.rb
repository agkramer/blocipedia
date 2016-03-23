User.create!(
  email: "kramer.alleng@gmail.com",
  password: "helloworld",
  role: "admin"
)

User.create!(
  email:    "standard@blocipedia.com",
  password: "helloworld",
  role:     "standard"
)

User.create!(
email:    "premium@blocipedia.com",
password: "helloworld",
role:     "premium"
)

5.times do
  User.create!(
    email:    Faker::Internet.email,
    password: "helloworld",
    role:     "standard"
  )
end

5.times do
  User.create!(
    email:    Faker::Internet.email,
    password: "helloworld",
    role:     "premium"
  )
end
users = User.all

30.times do
  Wiki.create!(
    title:    Faker::Hipster.word,
    body:     Faker::Hipster.paragraph,
    private:  Faker::Boolean.boolean,
    user:     users.sample
  )
end
wikis = Wiki.all
