module RailsStudy
  module V1
    class Survey < Grape::API
	  version "v1", using: :path
      format :json
	  prefix "api"
	  content_type :xml, "text/xml"
	
      resource :survey do
		desc 'Return list all'
        get do
		  survey = ::Survey.all
		  present survey
        end
	  end
		
        params do
          requires :id
        end
		resource :survey do
		desc 'Return list show'
			get ':id' do
			  ::Survey.find(params[:id])
			
			  ::SurveyQItem.where(survey_id: params[:id])
				
			  ::SurveyQItemList.where(survey_id: params[:id])
			end
		end

		params do
          requires :title
		  requires :detail
		  
        end
		
		 resource :survey do
			desc 'Return list all'
			post do
			  now_survey = ::Survey.new(title: params[:title], sub_title: params[:detail])
			  now_survey.save
			  @json = params[:question_list]
			  q_type = [], q_title = [], q_detail = []
			  q_list_len = 0;
			  puts @json
			  @json.each do |row|
				puts row[:title] 
   				puts row[:desc]
				puts row[:question_type]
				@json02 = row[:options]
				q_type << row[:question_type]
				q_title << row[:title]
				q_detail << row[:desc]
				  
				  @json02.each do |row|
				  	puts "this options #{row[:title]}"
				  end
				 
				q_list_len+=1
				now_survey_qestion = ::SurveyQItem.new(title: row[:title], desc: row[:desc], question_type: row[:question_type], survey_id: now_survey.id)
				now_survey_qestion.save
				@json02.each do |row|
					now_survey_qestion_item = ::SurveyQItemList.new(item: row[:title], survey_q_item_id:now_survey_qestion.id, survey_id:now_survey.id)
					now_survey_qestion_item.save
				end
			  end
			end
		 end
        # Edit a grape_survey01
        #
        # Example Request:
        #   PUT /v1/grape_survey01s/:id
        params do
          requires :title
        end
        put ':id' do
          grape_survey01 = Survey.find(params[:id])
          if grape_survey01.update(params)
            grape_survey01
          else
            grape_survey01.errors
          end
        end

      end
    end
end
