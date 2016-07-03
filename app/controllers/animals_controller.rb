class AnimalsController < ApplicationController
  ##before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /animals
  # GET /animals.json
  # def index
  #   @animals = Post.all
  # end

  # GET /animals/1
  # GET /animals/1.json
  def show
  end

  # GET /animals/new
  def new
    @animal = Animal.new
    @breeds = Breed.all
  end

  # GET /animals/1/edit
  def edit
    if @animal.user != current_user
      redirect_to posts_path
    end
  end

  # POST /animals
  # POST /animals.json
  def create
    @animal = Animal.new(post_params)
    @animal.breed_id = params["animal"]["breed"].to_i
    @animal.user = current_user
    # @animal.breed = Breed.find_by(name: 'Golden Retriever')

    respond_to do |format|
      if @animal.save
        format.html { redirect_to '/posts/new', notice: 'Post was successfully created.' }
        format.json { redirect_to '/posts/new', status: :created, location: @animal }
      else
        format.html { render :new }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /animals/1
  # PATCH/PUT /animals/1.json
  def update
    if @animal.user != current_user
      redirect_to posts_path
    end
    respond_to do |format|
      if @animal.update(animal_params)
        format.html { redirect_to @animal, notice: 'Animal was successfully updated.' }
        format.json { render :show, status: :ok, location: @animal }
      else
        format.html { render :edit }
        format.json { render json: @animal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /animals/1
  # DELETE /animals/1.json
  def destroy
    @animal.destroy
    respond_to do |format|
      format.html { redirect_to animals_url, notice: 'Animal was successfully deleted from database.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_animal
      @animal = Animal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:animal).permit(:user_id, :name, :color, :additional_notes, :image, :age, :size)
    end
end
