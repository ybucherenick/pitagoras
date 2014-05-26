class SuscribirController < ApplicationController 

	def new 

		@suscribir = Suscribir.new
	end


  def suscribe
     	  render 'suscribir/inicio'
  end

  	def suscribirse
  		@suscribir = Suscribir.new(secure_params)
  		@materiaRecibida = params[:materia];

  		connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"]) 
  		esta = 'no'

		if @suscribir.valid? and @materiaRecibida=="Contabilidad"

			ssc = connection.spreadsheet_by_title('Contabilidad')
		    wsc = ssc.worksheets[0] 
	        for row in 2..wsc.num_rows	          
	            if wsc[row,3]== session[:cedulaAlumno]
	            	esta = 'si'
	            end
	        end

	        if esta=='si'
				@suscribir.suscribete_Contabilidad		
				flash[:notice]= "Se registro en nuetra lista de correo de Contabilidad"
				render 'suscribir/exito'
			elsif esta=='no'
				flash[:error]= "Lo sentimos, pero usted no puede suscribirse a esta lista"
				render 'alumnos/inicio'
			end
				
		elsif @suscribir.valid? and @materiaRecibida=="Programacion"

			ssp = connection.spreadsheet_by_title('Programacion')
		    wsp = ssp.worksheets[0] 
	        for row in 2..wsp.num_rows	          
	            if wsp[row,3]== session[:cedulaAlumno]
	            	esta = 'si'
	            end
	        end

	        if esta=='si'
				@suscribir.suscribete_Programacion		
				flash[:notice]= "Se registro en nuetra lista de correo de Programacion"
				render 'suscribir/exito'
			elsif esta=='no'
				flash[:error]= "Lo sentimos, pero usted no puede suscribirse a esta lista"
				render 'alumnos/inicio'
			end

		elsif @suscribir.valid? and @materiaRecibida=="Redes"

			ssr = connection.spreadsheet_by_title('Redes')
	    	wsr = ssr.worksheets[0] 
	        for row in 2..wsr.num_rows	          
	            if wsr[row,3]== session[:cedulaAlumno]
	               @tabla[cont]= 'Redes'
	            end
	        end

	        if esta=='si'
				@suscribir.suscribete_Redes		
				flash[:notice]= "Se registro en nuetra lista de correo de Redes"
				render 'suscribir/exito'
			elsif esta=='no'
				flash[:error]= "Lo sentimos, pero usted no puede suscribirse a esta lista"
				render 'alumnos/inicio'
			end

		elsif @suscribir.valid?
			flash[:error]= "Esta materia no se encuentra en nuestra lista"
			render 'suscribir/inicio'
		else
			render :new
		end	

	end

	private 
	def secure_params
		params.permit(:email)
	end

end