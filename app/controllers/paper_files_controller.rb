class PaperFilesController < ApplicationController
  before_action :set_paper_file, only: [:show, :update, :destroy]

  # GET /paper_files
  def index
    @paper_files = PaperFile.all

    render json: @paper_files
  end

  # GET /paper_files/1
  def show
    render json: @paper_file
  end

  # POST /paper_files
  def create
    @paper_file = PaperFile.new(paper_file_params)

    if @paper_file.save
      render json: @paper_file, status: :created, location: @paper_file
    else
      render json: @paper_file.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /paper_files/1
  def update
    if @paper_file.update(paper_file_params)
      render json: @paper_file
    else
      render json: @paper_file.errors, status: :unprocessable_entity
    end
  end

  # DELETE /paper_files/1
  def destroy
    @paper_file.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_paper_file
    @paper_file = Paper_File.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def paper_file_params
    params.require(:paper_file).permit(:body)
  end
end
