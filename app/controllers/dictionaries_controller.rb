class DictionariesController < ApplicationController
  before_action :set_dictionary, only: [:show, :edit, :update, :destroy, :export]
  before_action :set_current_user

  # GET /dictionaries
  # GET /dictionaries.json
  def index
    redirect_to help_path unless helpers.logged_in?
    @dictionaries = Dictionary.all
  end

  # GET /dictionaries/1
  # GET /dictionaries/1.json
  def show
    @pagy, @entries = pagy(@dictionary.entries)
    @entry_count = @dictionary.entries.size
    cookies[:dictionary_page] = @pagy.vars[:page]
  end

  # GET /dictionaries/new
  def new
    @dictionary = Dictionary.new
  end

  # GET /dictionaries/1/edit
  def edit
  end

  # POST /dictionaries
  # POST /dictionaries.json
  def create
    @dictionary = Dictionary.new(dictionary_params)

    respond_to do |format|
      if @dictionary.save
        format.html { redirect_to @dictionary, notice: 'Dictionary was successfully created.' }
        format.json { render :show, status: :created, location: @dictionary }
      else
        format.html { render :new }
        format.json { render json: @dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dictionaries/1
  # PATCH/PUT /dictionaries/1.json
  def update
    respond_to do |format|
      p = dictionary_params
      sampa = Sampa.find_by_id(p[:sampa_id])
      p[:sampa] = sampa
      if @dictionary.update(p.except(:sampa_id))
        format.html { redirect_to @dictionary }
        format.json { render :show, status: :ok, location: @dictionary }
      else
        format.html { render :edit }
        format.json { render json: @dictionary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dictionaries/1
  # DELETE /dictionaries/1.json
  def destroy
    @dictionary.destroy
    respond_to do |format|
      format.html { redirect_to dictionaries_url, notice: 'Dictionary was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def export
    respond_to do |format|
      format.html { send_data gen_as_csv, filename: "#{@dictionary.name}.csv" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dictionary
      @dictionary = Dictionary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dictionary_params
      params.require(:dictionary).permit(:name, :edited, :sampa_id, :dictionary_id, :import_data)
    end

  def gen_as_csv
    file = CSV.generate('', headers: true, col_sep: "\t") do |csv|
      all_entries = @dictionary.entries.all.load
      csv << %w(word SAMPA)
      all_entries.each do |e|
        csv << [e.word, e.sampa]
      end
    end

    file
  end

  def set_current_user
    Current.user = helpers.current_user
  end
end
