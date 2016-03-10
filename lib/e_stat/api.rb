require 'faraday'
require 'json'

module EStat
  class API
    BASE_URL = 'http://api.e-stat.go.jp/rest/2.0/app/json/'

    def initialize(key, options={})
      @key = key
      @lang = options[:lang]
    end

    def get_stats_list(stats_field, stats_code, options={})
      response = Faraday.get("#{BASE_URL}getStatsList", {
          appId: @key,
          lang: @lang,
          statsField: stats_field,
          statsCode: stats_code,
          surveyYears: options[:survey_years],
          openYears: options[:open_years],
          searchWord: options[:search_word],
          searchKind: options[:search_kind],
          statsNameList: options[:stats_name_list],
          startPosition: options[:start_position],
          updatedDate: options[:updated_date]
      })
      attributes = JSON.parse(response.body)
      attributes['GET_STATS_LIST']
    end

    def get_meta_info(stats_data_id)
      response = Faraday.get("#{BASE_URL}getMetaInfo", {
          appId: @key,
          lang: @lang,
          statsDataId: stats_data_id
      })
      attributes = JSON.parse(response.body)
      attributes['GET_META_INFO']
    end

    def get_stats_data(stats_data_id)
      response = Faraday.get("#{BASE_URL}getStatsData", {
          appId: @key,
          lang: @lang,
          statsDataId: stats_data_id
      })
      attributes = JSON.parse(response.body)
      attributes['GET_STATS_DATA']
    end
  end
end