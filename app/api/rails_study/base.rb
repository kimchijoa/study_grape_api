module RailsStudy
  class Base < Grape::API
    mount RailsStudy::V1::Survey
  end
end