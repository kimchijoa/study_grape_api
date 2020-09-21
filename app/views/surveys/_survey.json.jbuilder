json.extract! survey, :id, :title, :sub_title, :created_at, :updated_at
json.url survey_url(survey, format: :json)
