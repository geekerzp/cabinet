class PapersController < ApplicationController
  before_action :set_paper, only: [:show, :update, :destroy]
  before_action :set_paper_file, only: [:index]

  def index
    @papers = @paper_file.papers

    render json: @papers
  end

  def show
    render json: @paper
  end

  def create
    @paper = Paper.new(paper_params)

    if @paper.save
      render json: @paper, status: :created, location: @paper
    else
      render json: @paper.errors, status: :unprocessable_entity
    end
  end

  def update
    if @paper.update(paper_params)
      render json: @paper
    else
      render json: @paper.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @paper.destroy!
  end

  private

  def set_paper
    @paper = Paper.find_by(uuid: params[:id])
  end

  def set_paper_file
    @paper_file = PaperFile.find_by(uuid: params[:paper_file_id])
  end

  def paper_params
    params.permit(:body)
  end
end
