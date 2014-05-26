class AnotasController < ApplicationController 

	def new 

		@anotas = Anotas.new
	end

  def index
     	  render 'anotas/inicio'
  end

  	def vernotas
  		@anotas = Anotas.new(secure_params)
  		
  		@materiaRecibida = params[:materiaConsultar];
  		if @anotas.valid?

			render 'anotas/ver'
		end
	end

	private 
	def secure_params
		params.permit(:materiaConsultar)
	end

end