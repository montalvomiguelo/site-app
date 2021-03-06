class SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :edit, :update, :destroy]
  
  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Administrador de Secciones", :sections_index_path

  # GET /surveys
  # GET /surveys.json
  def index
    @surveys = Survey.all
    add_breadcrumb "Diagnósticos", surveys_path
  end

  # GET /surveys/1
  # GET /surveys/1.json
  def show
	add_breadcrumb "Diagnósticos", surveys_path
	add_breadcrumb @survey.title, survey_path(@survey)
  end

  # GET /surveys/new
  def new
    @survey = Survey.new
    add_breadcrumb "Diagnósticos", surveys_path
  end

  # GET /surveys/1/edit
  def edit
	add_breadcrumb "Diagnósticos", surveys_path
	add_breadcrumb 'Editar ' + @survey.title, edit_survey_path(@survey)
  end

  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)

    respond_to do |format|
      if @survey.save
        format.html { redirect_to @survey, notice: 'El Diagnóstico fue creado correctamente.' }
        format.json { render :show, status: :created, location: @survey }
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    respond_to do |format|
      if @survey.update(survey_params)
        format.html { redirect_to surveys_path, notice: 'El Diagnóstico fue actualizado correctamente.' }
        format.json { render :show, status: :ok, location: @survey }
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    respond_to do |format|
      if @survey.destroy
        format.html { redirect_to surveys_url, notice: 'El Diagnóstico fue eliminado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.require(:survey).permit(:title)
    end
end
