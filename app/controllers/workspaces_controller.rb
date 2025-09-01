class WorkspacesController < ApplicationController
  before_action :set_workspace, only: %i[ show edit update destroy ]

  # GET /workspaces or /workspaces.json
  def index
    @workspaces = Workspace.all
  end

  # GET /workspaces/home
  def home
    @workspaces = Workspace.all
  end
  def search
    if params[:title_search].present?
      @workspaces = Workspace.where("workspaces.subjects ILIKE ?", "%#{params[:title_search]}")
    else 
      @workspaces = []

  end
  
   respond_to do |format|
    format.turbo_stream do
      render turbo_stream: turbo_stream.update("search_results", partial: "workspaces/search_results", locals: {workspaces: @workspaces})

    end 
  end
end

  # GET /workspaces/1 or /workspaces/1.json
  def show
    # @workspace is already set by set_workspace callback

  end

  # GET /workspaces/new
  def new
    @workspace = Workspace.new
  end

  # GET /workspaces/1/edit
  def edit
  end

  # POST /workspaces or /workspaces.json
  def create
    @workspace = Workspace.new(workspace_params)

    respond_to do |format|
      if @workspace.save
        format.html { redirect_to @workspace, notice: "Workspace was successfully created." }
        format.json { render :show, status: :created, location: @workspace }
      else
        format.html { render :new, status: :unprocessable_content }
        format.json { render json: @workspace.errors, status: :unprocessable_content }
      end
    end
  end

  # PATCH/PUT /workspaces/1 or /workspaces/1.json
  def update
    respond_to do |format|
      if @workspace.update(workspace_params)
        format.html { redirect_to @workspace, notice: "Workspace was successfully updated."}
        format.json { render :show, status: :created, location: @workspace }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @workspace.errors, status: :unprocessable_content }
      end
    end
  end

  # DELETE /workspaces/1 or /workspaces/1.json
  def destroy
    @workspace.destroy!

    respond_to do |format|
      format.html { redirect_to workspaces_path, notice: "Workspace was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private 
    # Use callbacks to share common setup or constraints between actions.
    def set_workspace
      @workspace = Workspace.find(params.expect(:id))  # Fixed: use :id parameter
    end

    # Only allow a list of trusted parameters through.
    def workspace_params
      params.require(:workspace).permit(:subjects, :notes)
    end
end 