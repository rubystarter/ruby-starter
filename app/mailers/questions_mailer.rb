class QuestionsMailer < ActionMailer::Base
  default from: "do-not-reply@example.com"

  def comment_notfication (user, article)
  	@user = user
  	@article = article

  	mail(to: user.email, subject: "You have got new article!")

  end
end
