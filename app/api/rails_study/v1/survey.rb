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
			  @show_survey_all = []
			  @show_survey_all << ::Survey.find(params[:id])
			  @show_survey_all << ::SurveyQItem.where(survey_id: params[:id])
			  @show_survey_all << ::SurveyQItemList.where(survey_id: params[:id])
			  present @show_survey_all
			end
		end

		params do
          requires :title
		  requires :detail
		  
        end
		
		 resource :survey do
			desc 'Return list all'
			post do
			  # 설문지 문항중 radio_btn, check_box 와 placeholder를 구분하기 위해 추가합니다.
			  q_state = 1
			  # 파라미터로 받아온 title, detail을 설문지 이름, 설문지 내용으로 추가합니다.
			  now_survey = ::Survey.new(title: params[:title], sub_title: params[:detail])
			  # 설문지를 저장합니다.
			  now_survey.save
			  # 해쉬 변수에 설문지의 문항 정보들을 저장합니다.
			  @json = params[:question_list]
			  q_type = [], q_title = [], q_detail = []
			  q_list_len = 0;
			  puts @json
			  # 반복문을 통해 각 설문지 문항 정보(문항 이름, 문항 내용)들을 배열에 저장합니다.
			  @json.each do |row|
				puts row[:title] 
   				puts row[:desc]
				puts row[:question_type]
				
				@json02 = row[:options]
				# 문항 정보 저장중 placeholder 값이 있다면 q_state를 2로 변경합니다(문항의 선택란 타입 변경 시에 이용)
				q_state = 1
				if row[:placeholder].present?
					@json02 = row[:placeholder]
					puts "this options #{row[:placeholder]}"
					q_state = 2
				end
				
				q_type << row[:question_type]
				q_title << row[:title]
				q_detail << row[:desc]
				  
				 
				#q_list_len+=1
				# 저장한 내용을 기반으로 문항 정보(문항 이름, 문항 설명)을 저장합니다.(이때 이 문항은 위에서 저장한 설문지의 pk를 fk로 받아와 저장합니다.)
				now_survey_qestion = ::SurveyQItem.new(title: row[:title], desc: row[:desc], question_type: row[:question_type], survey_id: now_survey.id)
				now_survey_qestion.save
				
				# 문항의 선택란 타입이 placeholder와 선택 타입인 경우를 고려하여 받아오는 피라미터를 구분하여 저장합니다.
				if q_state == 2
					now_survey_qestion_item = ::SurveyQItemList.new(item: row[:placeholder], survey_q_item_id:now_survey_qestion.id, survey_id:now_survey.id)
					now_survey_qestion_item.save
				else q_state == 1
					@json02.each do |row|
						now_survey_qestion_item = ::SurveyQItemList.new(item: row[:title], survey_q_item_id:now_survey_qestion.id, survey_id:now_survey.id)
						now_survey_qestion_item.save
					end
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
