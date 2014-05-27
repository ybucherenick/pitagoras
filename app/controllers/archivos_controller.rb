class ArchivosController < ApplicationController 

	def new 

		@archivo = Archivo.new
	end


    def entrada
     	render 'archivos/cargar'
  	end

  	#Verifico la ruta que se envia junto a la materia del docente al metodo subir que se encuentra en el modelo
	def enviar
		@archivo = Archivo.new(secure_params)
		if @archivo.valid?
			@archivo.subir(session['materiaDocente'])
			#UsuarioCorreo.contacto_email(@contacto).deliver
			flash[:notice] = "La carga se realizo exitosamente!!! :)"
			render 'archivos/guardar'
		else
			render :new
		end
	end

	private 
	def secure_params
		params.permit(:ruta)
	end

  	def enviarO

  		@archivo =params[:ruta]
  		flash[:notice]= ":)"
		#if @archivo.valid?
			#@suscribir.suscribete		
			flash[:notice]= "Las notas fueron cargadas exitosamente"


		connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"]) 
	    ss = connection.spreadsheet_by_title('prueba')
	    if ss.nil? 
	       ss = connection.create_spreadsheet('prueba') 
	    end 
	    ws = ss.worksheets[0] 
	    last_row = 1 + ws.num_rows 
	    ws[last_row, 1] = Time.new 
	    ws[last_row, 2] = @archivo
	    ws.save

			render 'archivos/guardar'
		#end

  	end

end
