class TagsController < ApplicationController

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# CALLBACKS  
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	before_action :set_tag, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_user!, except: [:index]
	before_action :sidebar_tags, only: [:index, :new, :create]


# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# GET : Index
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def index
		@tags = Tag.all
	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# GET : Show
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def show
	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# GET : New
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def new
		@tag = Tag.new
	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# GET : Edit
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def edit
	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# POST : Create
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def create

		@tag = Tag.new(tag_params) 

		respond_to do |format|

		  if @tag.save
		    format.html { redirect_to root_path, notice: 'tag was successfully created.' }
		    format.json { render :show, status: :created, location: @tag }
		  else
		    format.html { render :new }
		    format.json { render json: @tag.errors, status: :unprocessable_entity }
		  end

		end

	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# PUT : Update
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def update
		respond_to do |format|
		  if @tag.update(tag_params)
		    format.html { redirect_to root_path, notice: 'tag was successfully updated.' }
		    format.json { render :show, status: :ok, location: @tag }
		  else
		    format.html { render :edit }
		    format.json { render json: @tag.errors, status: :unprocessable_entity }
		  end
		end
	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# DELETE : Destroy
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	def destroy
		@tag.destroy
		respond_to do |format|
		  format.html { redirect_to tags_url, notice: 'tag was successfully destroyed.' }
		  format.json { head :no_content }
		end
	end

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------
# PRIVATE 
# ---------------------------------------------------------------------------------------------------------------------------------------------------------------

	private
	# Use callbacks to share common setup or constraints between actions.
	def set_tag
		@tag = Tag.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def tag_params
		params.require(:tag).permit(:title)
	end

end
