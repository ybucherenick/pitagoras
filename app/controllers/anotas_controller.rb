class AnotasController < ApplicationController 

	def new 

		@anotas = Anotas.new
	end

  	def vernotas
  		
  	
  			@tabla = []
  			cont=0
			connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"]) 
			
		    ssp = connection.spreadsheet_by_title('Programacion')
		    wsp = ssp.worksheets[0] 
	        for row in 2..wsp.num_rows	          
	            if wsp[row,3]== session[:cedulaAlumno]
	               @tabla[cont]= 'Programacion'
	               cont= cont+1
	               @tabla[cont] = wsp[row,4]
	               cont= cont+1
	               @tabla[cont] = wsp[row,5]
	               cont= cont+1
	               @tabla[cont] = wsp[row,6]
	               cont= cont+1
	               @tabla[cont] = wsp[row,7]
	               cont= cont+1 
	            end
	        end
	        wsp.save 
		

		    ssc = connection.spreadsheet_by_title('Contabilidad')
		    wsc = ssc.worksheets[0] 
	        for row in 2..wsc.num_rows	          
	            if wsc[row,3]== session[:cedulaAlumno]
	               @tabla[cont]= 'Contabilidad'
	               cont= cont+1
	               @tabla[cont] = wsc[row,4]
	               cont= cont+1
	               @tabla[cont] = wsc[row,5]
	               cont= cont+1
	               @tabla[cont] = wsc[row,6]
	               cont= cont+1
	               @tabla[cont] = wsc[row,7]
	               cont= cont+1 	      			
	            end
	        end
	        wsc.save 


		    ssr = connection.spreadsheet_by_title('Redes')
	    	wsr = ssr.worksheets[0] 
	        for row in 2..wsr.num_rows	          
	            if wsr[row,3]== session[:cedulaAlumno]
	               @tabla[cont]= 'Redes'
	               cont= cont+1
	               @tabla[cont] = wsr[row,4]
	               cont= cont+1
	               @tabla[cont] = wsr[row,5]
	               cont= cont+1
	               @tabla[cont] = wsr[row,6]
	               cont= cont+1
	               @tabla[cont] = wsr[row,7]
	               cont= cont+1 
	      
	            end
	        end
	        wsr.save 

			render 'anotas/inicio'
	
	end

end