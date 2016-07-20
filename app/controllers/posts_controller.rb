class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token, only: [:found_submit]

  geocode_ip_address

  def index
    # @posts = Post.all
    @posts = Post.within(5, :origin => "707 Broadway, San Diego")
  end

  def index_json
    @posts = Post.within(5, :origin => "707 Broadway, San Diego")
    posts = @posts.includes(animal: :breed).as_json(include: { animal: { include: :breed, methods: :image_url_thumb } })
    render json: posts
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @pets = Animal.where(user_id: current_user.id)
    # @pets = Animal.find_by(user: current_user)
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
    if @post.user != current_user && current_user.admin == false
      redirect_to posts_path
    end
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.animal = current_user.animals.last
    @post.found_status = false
    @post.lat = Post.geocode(@post.location).lat
    @post.lng = Post.geocode(@post.location).lng

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_path @post, notice: 'Post was successfully created.' }
        format.json { redirect_to post_path @post, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    if @post.user == current_user || current_user.admin == true
      respond_to do |format|
        if @post.update(post_params)
          format.html { redirect_to @post, notice: 'Post was successfully updated.' }
          format.json { render :show, status: :ok, location: @post }
        else
          format.html { render :edit }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to posts_path
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    if @post.user = current_user || current_user.admin == true
      @post.destroy
      respond_to do |format|
        format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      redirect_to posts_path
    end
  end

  def resource_found
    render '/posts/resourcefound'
  end

  def found_form
    render '/posts/foundform'
  end

  def found_submit
    @breed = Breed.find_by(name: params[:breed])
    @species = @breed.species
    @color = params[:color]
    @location = params[:location]
    @shelter_name = params[:shelter_name]
    @date = params[:date]
    @additional_notes = params[:additional_notes]
    @image_url = params[:image_url]
    render '/posts/showfound'
  end

def filter_based_on_location()
    puts "PARAMS ARE ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts params
    posts = Post.within(5, :origin => "707 Broadway, San Diego")
    puts posts
    render json: posts
end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:user_id, :animal_id, :found_status, :location, :phone, :email, :date)
      # we need to permit :image also, but currently it is an attribute of animal not post
    end
end
