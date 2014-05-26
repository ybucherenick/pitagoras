class DocentesController < ApplicationController 

	def new 

		@docente = Docente.new
	end


  #Se definen las variables de sesion del docente
  def entrada
     @claveRecibido = params[:clave];
     if @claveRecibido=='123' 
        session['cedulaDocente'] = params[:clave]
        session['nombreDocente'] = "Roxana Carrera"
        session['materiaDocente'] = "Contabilidad"
        render 'docentes/inicio'
      elsif @claveRecibido=='456'
        session['cedulaDocente'] = params[:clave]
        session['nombreDocente'] = "Yolymar Bucherenick"
        session['materiaDocente'] = "Programacion"
        render 'docentes/inicio'
      elsif @claveRecibido=='789'
        session['cedulaDocente'] = params[:clave]
        session['nombreDocente'] = "Joselyn Ortuño"
        session['materiaDocente'] = "Redes"
        render 'docentes/inicio'
      else
        flash[:error] = "Usted no es Docente!!!!"
        redirect_to root_path
      end   
  end

end