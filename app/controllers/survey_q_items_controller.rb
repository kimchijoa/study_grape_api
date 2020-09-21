class SurveyQItemsController < ApplicationController
  before_action :set_survey_q_item, only: [:show, :edit, :update, :destroy]

  # GET /survey_q_items
  # GET /survey_q_items.json
  def index
    @survey_q_items = SurveyQItem.all
  end

  # GET /survey_q_items/1
  # GET /survey_q_items/1.json
  def show
  end

  # GET /survey_q_items/new
  def new
    @survey_q_item = SurveyQItem.new
  end

  # GET /survey_q_items/1/edit
  def edit
  end

  # POST /survey_q_items
  # POST /survey_q_items.json
  def create
    @survey_q_item = SurveyQItem.new(survey_q_item_params)

    respond_to do |format|
      if @survey_q_item.save
        format.html { redirect_to @survey_q_item, notice: 'Survey q item was successfully created.' }
        format.json { render :show, status: :created, location: @survey_q_item }
      else
        format.html { render :new }
        format.json { render json: @survey_q_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_q_items/1
  # PATCH/PUT /survey_q_items/1.json
  def update
    respond_to do |format|
      if @survey_q_item.update(survey_q_item_params)
        format.html { redirect_to @survey_q_item, notice: 'Survey q item was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_q_item }
      else
        format.html { render :edit }
        format.json { render json: @survey_q_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_q_items/1
  # DELETE /survey_q_items/1.json
  def destroy
    @survey_q_item.destroy
    respond_to do |format|
      format.html { redirect_to survey_q_items_url, notice: 'Survey q item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_q_item
      @survey_q_item = SurveyQItem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def survey_q_item_params
      params.require(:survey_q_item).permit(:type, :s_title, :s_sub_title, :survey_id)
    end
end
