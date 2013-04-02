namespace :performance do
	desc "Generate a 100 random article"
	task generate_articles: :environment do 
		100.times do 
			puts Article.create(topic_id: 11, user_id: 1, title: "Performance Test " + Faker::Lorem.sentence, content: Faker::Lorem.paragraph)
		end
	end
end