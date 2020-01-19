class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    if params[:dictionary_id]
      @dictionary = Dictionary.find(params[:dictionary_id])
      @entries = @dictionary.entries
    else
      @entries = Entry.all
    end
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @dictionary = Dictionary.find(params[:dictionary_id])
    @entry = Entry.new
    @url = dictionary_entries_path(@dictionary)
  end

  # GET /entries/1/edit
  def edit
    @url = dictionary_entry_path(@dictionary, @entry)
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    @dictionary = Dictionary.find(params[:dictionary_id])
    respond_to do |format|
      if @entry.save
        format.html { redirect_to dictionary_entry_path(@dictionary, @entry), notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        #params[:page]=cookies[:directory_page]
        #params[:id]=nil
        redir_url = cookies[:before_url].nil? ? dictionary_url(@dictionary): cookies[:before_url]
        format.html { redirect_to redir_url }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to dictionary_entries_url(@dictionary), notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
      @dictionary = @entry.dictionary
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:word, :sampa, :comment, :user_id, :dictionary_id)
    end
end
