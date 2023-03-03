puts "🌱 Seeding data..."

# place your seeds here

Category.create(name: "Freelance")
Category.create(name: "Proffesional")
Category.create(name: "Lowcome")

Category.all.each do |category|
    6.times do 
        Project.create(
      title: Faker::Lorem.sentence(word_count: 5),
      description: Faker::Lorem.sentence(word_count: 20),
      category_id: category.id,
      status: false,
    )

    end

    end

puts "🌱 Done seeding!"