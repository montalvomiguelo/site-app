class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  
  add_breadcrumb "Inicio", :root_path
  add_breadcrumb "Administrador de Secciones", :sections_index_path

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
    add_breadcrumb "Factores", categories_path
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
	add_breadcrumb "Factores", categories_path
	add_breadcrumb @category.title, category_path(@category)
  end

  # GET /categories/new
  def new
    @category = Category.new
    add_breadcrumb "Factores", categories_path
  end

  # GET /categories/1/edit
  def edit
	add_breadcrumb "Factores", categories_path
	add_breadcrumb @category.title, category_path(@category)
	add_breadcrumb 'Editar ' + @category.title, edit_category_path(@category)
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'El Factor se ha creado correctamente.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'El Factor fue actializado correctamente.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    respond_to do |format|
      if @category.destroy
        format.html { redirect_to categories_url, notice: 'El Factor fue eliminado correctamente.' }
        format.json { head :no_content }
      else
        format.html { render :show }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:title, :icon, :color)
    end
end
