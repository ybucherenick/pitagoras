class DnotasController < ApplicationController 

	def new 

		@anotas = Anotas.new
	end
    
    #Se guarda todas las notas de la materia que da el profesor en un arreglo 
  	def vernotas

  			@tabla = []
  			cont=0
			connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"]) 
			if session['materiaDocente']=='Programacion'
				ss = connection.spreadsheet_by_title('Programacion')
			elsif session['materiaDocente']=='Contabilidad'
				ss = connection.spreadsheet_by_title('Contabilidad')
		    elsif session['materiaDocente']=='Redes'
				ss = connection.spreadsheet_by_title('Redes')
			end	

			if !(ss.nil?)
			    ws = ss.worksheets[0] 
		        for row in 2..ws.num_rows
		        	for col in 1..ws.num_cols
		               @tabla[cont]= ws[row,col]
		               cont= cont+1
		            end
		        end
		        ws.save 
		        render 'dnotas/inicio'
	    	elsif ss.nil?	    		
	    		flash[:error]= "Usted no posee ninguna hoja de calculo"
	    		render 'inicio'
	    	end
		
	
	end

end