class SurveyQItemListsController < ApplicationController
  before_action :set_survey_q_item_list, only: [:show, :edit, :update, :destroy]

  # GET /survey_q_item_lists
  # GET /survey_q_item_lists.json
  def index
    @survey_q_item_lists = SurveyQItemList.all
  end

  # GET /survey_q_item_lists/1
  # GET /survey_q_item_lists/1.json
  def show
  end

  # GET /survey_q_item_lists/new
  def new
    @survey_q_item_list = SurveyQItemList.new
  end

  # GET /survey_q_item_lists/1/edit
  def edit
  end

  # POST /survey_q_item_lists
  # POST /survey_q_item_lists.json
  def create
    @survey_q_item_list = SurveyQItemList.new(survey_q_item_list_params)

    respond_to do |format|
      if @survey_q_item_list.save
        format.html { redirect_to @survey_q_item_list, notice: 'Survey q item list was successfully created.' }
        format.json { render :show, status: :created, location: @survey_q_item_list }
      else
        format.html { render :new }
        format.json { render json: @survey_q_item_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_q_item_lists/1
  # PATCH/PUT /survey_q_item_lists/1.json
  def update
    respond_to do |format|
      if @survey_q_item_list.update(survey_q_item_list_params)
        format.html { redirect_to @survey_q_item_list, notice: 'Survey q item list was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_q_item_list }
      else
        format.html { render :edit }
        format.json { render json: @survey_q_item_list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_q_item_lists/1
  # DELETE /survey_q_item_lists/1.json
  def destroy
    @survey_q_item_list.destroy
    respond_to do |format|
      format.html { redirect_to survey_q_item_lists_url, notice: 'Survey q item list was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_q_item_list
      @survey_q_item_list = SurveyQItemList.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_q_item_list_params
      params.require(:survey_q_item_list).permit(:survey_q_item_id, :item)
    end
end
