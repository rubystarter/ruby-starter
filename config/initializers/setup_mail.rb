ActionMailer::Base.smtp_settings = {
	:address		=> "smtp.gamil.com",
	:port			=> 587,
	:domain			=> "gamil.com",
	:user_name		=> "answerawesome",
	:password		=> "Sup3r$ecret",
	:authentication	=> "plain",
	:enable_starttls_auto =>true
}