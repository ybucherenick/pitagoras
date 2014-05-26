class Archivo < ActiveRecord::Base
	has_no_table

	column :ruta, :string

	validates_presence_of :ruta


	def subir (materia)
		
       conexion = GoogleDrive.login(ENV["GMAIL_USERNAME"], ENV["GMAIL_PASSWORD"]) 
       doc = conexion.spreadsheet_by_title('Prueba4')
       if (!doc.nil?) 
       		doc.delete 
       		doc= conexion.create_spreadsheet(materia)   
       else
       		doc= conexion.create_spreadsheet(materia) 
       end 

       ws = doc.worksheets[0]


       #guardo los datos del excel en un arreglo llamado celdas
       $celdas=[] 
	     ex = Roo::Excel.new("#{Rails.root}/public/"+self.ruta)

	     ex.default_sheet = ex.sheets.first
	     posC=0

	     pos=''
	     for fila in (1 .. ex.last_row)
	        for columna in (1 .. ex.last_column)
	           $celdas[posC]= ex.cell(fila,columna)
	           posC=posC+1
	        end
	     end

	   #paso del arreglo celdas a escribir en el google drive
	   pos=0    
	   for fila in (1.. ($celdas.length/7))
	       last_row = 1 + ws.num_rows
	       for columna in (1 .. 7)
		       ws[last_row, columna] = $celdas[pos]
		       pos=pos+1
		   end  
	   end 
       ws.save 
	end 

end