class UsuarioCorreo < ActionMailer::Base
  default from: "from@example.com"

  def contacto_email(suscribir)
  	#suscribir.email es el email del visitante
  	#OWNER_EMAIL email del propietario del site configurado con figaro
  	@suscribir = suscribir
  	mail(to:ENV["OWNER_EMAIL"], from: @suscribir.email, :subject =>"Docente contacto")
  end
end
