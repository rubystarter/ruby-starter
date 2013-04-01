namespace :articles do
	desc "Generate a 100 random article"
	task generate_articles: :environment do 
		100.times do
			puts Article.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph)
		end
	end
end