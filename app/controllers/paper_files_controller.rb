class PaperFilesController < ApplicationController
  before_action :set_paper_file, only: [:show, :update, :destroy, :download]
  before_action :set_paper, only: [:index]
  before_action :set_papers, only: [:create, :update]

  def index
    @paper_files = @paper.paper_files

    render json: @paper_files
  end

  def show
    render json: @paper_file
  end

  def create
    @paper_file = PaperFile.new(
      data: params[:data],
      filename: params[:data].try(:original_filename),
      from_who: params[:from_who]
    )

    @paper_file.papers << @papers

    if @paper_file.save
      render json: @paper_file, status: :created, location: @paper_file
    else
      render json: @paper_file.errors, status: :unprocessable_entity
    end
  end

  def update
    if @paper_file.update(papers: @papers)
      render json: @paper_file
    else
      render json: @paper_file.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @paper_file.destroy!
  end

  def download
    send_file @paper_file.data.path, filename: @paper_file.filename
  end

  private

  def set_paper
    @paper = Paper.find(params[:paper_id])
  end

  def set_papers
    paper_ids = params[:paper_ids]
    @papers = paper_ids.to_a.reject(&:blank?).map { |id| Paper.find id }
  end

  def set_paper_file
    @paper_file = PaperFile.find(params[:id])
  end

  def paper_file_params
    params.permit(:data, :filename, :from_who, :paper_ids)
  end
end
