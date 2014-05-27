class AlumnosController < ApplicationController 

	def new 

		@alumno = Alumno.new
	end

  #Se definen las variables de sesion del alumno
  def entrada
     @cedulaRecibida = params[:cedula];
     if @cedulaRecibida=='20123445' 
        session['cedulaAlumno'] = params[:cedula]
        session['nombreAlumno'] = "Mariangela Delgado"
        render 'alumnos/inicio'
      elsif @cedulaRecibida=='20123456' 
        session['cedulaAlumno'] = params[:cedula]
        session['nombreAlumno'] = "Javier Velasquez"
        render 'alumnos/inicio'
      elsif @cedulaRecibida=='20456789'
        session['cedulaAlumno'] = params[:cedula]
        session['nombreAlumno'] = "Maria Gabriela Loreto"     	  
        render 'alumnos/inicio'
      else
        flash[:error] = "Usted no es un Alumno!!!!"
        redirect_to root_path
      end 	
  end

end