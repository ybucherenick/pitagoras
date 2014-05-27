class AnotasController < ApplicationController 

	def new 

		@anotas = Anotas.new
	end

    #Se buscan las notas de todas las materias en la que el alumno se encuentra y se guardan en un arreglo
  	def vernotas
  		
  	
  			@tabla = []
  			cont=0
			connection = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"]) 
			
		    ssp = connection.spreadsheet_by_title('Programacion')
		    if !(ssp.nil?)
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
		    end
		

		    ssc = connection.spreadsheet_by_title('Contabilidad')
		    if !(ssc.nil?)
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
	  		end


		    ssr = connection.spreadsheet_by_title('Redes')
		    if !(ssr.nil?)
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
		    end

			render 'anotas/inicio'
	
	end

end