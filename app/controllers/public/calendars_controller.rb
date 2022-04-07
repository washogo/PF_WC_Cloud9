
require "google/apis/calendar_v3"
require "googleauth"
require "googleauth/stores/file_token_store"
require "date"
require "fileutils"
class Public::CalendarsController < ApplicationController



  # The file token.yaml stores the user's access and refresh tokens, and is
  # created automatically when the authorization flow completes for the first
  # time.



  ##
  # Ensure valid credentials, either by restoring from the saved credentials
  # files or intitiating an OAuth2 authorization. If authorization is required,
  # the user's default browser will be launched to approve the request.
  #
  # @return [Google::Auth::UserRefreshCredentials] OAuth2 credentials

  def index
  end

  def authorize
    # secret_hash = {
    #   {
    #     "type" => "service_account",
    #     "project_id" => "learn-community-345904",
    #     "private_key_id" => "ee8636616eb072cf1d53f6c5ef62354af1667628",
    #     "private_key" => "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDzFr6QnshhhGIA\ngoGKX/nz2fTvYkzHkkFq43yEGHxviZnpbDPIC8LIcaOQHzjdtZ/wkMqQ3VuARV/L\npSNDJBdhIDQ1RB4xyjRaWr8ctsRUHR4hkmfaPOjoUY7mEJDTM1QvoHFNRwA5m+c/\npDzfCILDK4ZlX7DOErG1u+NdmoelhMmceJaN9mG6tiCcQbg5OwnfMjScXVV0UE/X\n02MQkg3lCLXtXIiSg8Zy947DUTb5j/dcXQkz0YggVFzUped5YeillUiuuQBa/AyM\nC76hGU3NZypLs4+2AyuQrDJY1ix+0o9z3emiiQEv/OV0Vo0c/IGm8rb1gtWURkgH\n5xLGFnMfAgMBAAECggEAK/O1Uf27mlIuzAvMs0HGNk52yF+cJUtu844dId8xhJM7\nFmbfd/CUb9yIJ9NVW1TvDbaIQagcVrV0bCQ4G3gnmAKUHftqgDMgwyN8QYtUNScs\nnwJTL7TqobK5ZSSiouU5eAEI62GGi2QCbFHcRbFKv1Ib0zF5jND5e7P0mKSLmSPu\nenpPEhBN797sImlpkFCQYKNGIvtAqZ/1IdxI96pszGij5G4ldUebtSlLzy6WkrQv\nDtXUQSn7bb615AjleFn+M0PmsST8OcLuduUUB8FnJTYFijo+KbLplPvByGTWWPj5\nb+URVnzERP+H6SRLEdCmVIkFl9tci1u0NASemEJ4mQKBgQD/L0PqRtvUG2Hlwms4\nP+yed4/UBIWo4CjLJW/41UW4r5oRbleYp229e+qtzzeUwAD/TIvHXfSptYJRoU6Z\nY0nQw8sCgJ8UO21V5aI9SJJ8wu3P5KiPHeF7vLIpU8ToDP0H7KyhlEw+u978YrKf\nWV366e9Tve+W3XfrS8BhaJ3rdwKBgQDz3ZXFuvhgDh5snrd8ywm5fTl4xguu762n\nYCoJppZfG2lBr/wMp1KipC0aJr4n106zjd68fm+Xov/aS0Ay+naJCifSVj++U+Ex\nmpJybn/nxCM+a2lnlUn7ynwvPAl2hwrk2cOUpwVGM5xZ+uA2Aaw97Yom/202d6E6\nxKrEqQ1PmQKBgETFeiojGo9ZKdL/yGGKaLx0QGDFLzhJ4PSOjFSlNXsGaCEWeaj8\nRkjwolhhJfuCm0IyYOFD4vHxpsNVE5em+He4rHdqLnUHZvnlPwoBCulwpyKF3x9i\n0CfGvMUCfGiFR5PhJs0M6Fdnzjp6ZuUm8nrynLsWzwD7gpv4+EnIJfcVAoGAckm0\nuXhIkuvLAmjX4Vpeclnnp1xZeWDGZ5y/1soFywjTqX9KhrucFLEQmiLyF0Xmkmu4\nqWov7kbr1WhS7BFJoCvsQb0+Hnq9HTwtygdTVlErm0NHoM3sYF6jGJfwb2YWiu4r\npO0poZ7qdZkHnwflqxg6GNC4ZEBohVxKE+SOYnECgYBvgC1cNibUXCRw8LDNaHGy\nlOZB4S9mVtebDBQQfBU1bibtNolAaALGI7NRGV+FZbsgoL5fhkRQda0IN8q0HIfo\nV+YGFtftRXsvaOTOAKaIEGLJQ+IjWb92vubhnK6/vdE2Fe8/lY4htQs4nl9zoVAu\nizOAsImrXm0ysk6DuShLNw==\n-----END PRIVATE KEY-----\n",
    #     "client_email" => "user1-433@learn-community-345904.iam.gserviceaccount.com",
    #     "client_id" => "110648055714233114419",
    #     "auth_uri" => "https://accounts.google.com/o/oauth2/auth",
    #     "token_uri" => "https://oauth2.googleapis.com/token",
    #     "auth_provider_x509_cert_url" => "https://www.googleapis.com/oauth2/v1/certs",
    #     "client_x509_cert_url" => "https://www.googleapis.com/robot/v1/metadata/x509/user1-433%40learn-community-345904.iam.gserviceaccount.com"
    #   }
    # }
    # 環境変数の定義
    uri = ENV["REDIRECT_URIS"]
    user_id = ENV["USER_ID"]

    secret_hash = {
      "web" => {
        "client_id"     => ENV["GOOGLE_CLIENT_ID"],
        "project_id" => ENV["PROJECT_ID"],
        "auth_uri" => ENV["AUTH_URI"],
        "token_uri" => ENV["TOKEN_URI"],
        "auth_provider_x509_cert_url" => ENV["PROVIDER_URI"],
        "client_secret" => ENV["GOOGLE_CLIENT_SECRET"],
        "redirect_uris" => ENV["REDIRECT_URIS"],
        "javascript_origins" => ENV["JAVASCRIPT_ORIGINS"],
      }
    }
      # herokuの環境的に環境変数から読み込んだほうが良い
      client_id = Google::Auth::ClientId.from_hash secret_hash
      token_store = Google::Auth::Stores::FileTokenStore.new file: "token.yaml"
      authorizer = Google::Auth::UserAuthorizer.new client_id, Google::Apis::CalendarV3::AUTH_CALENDAR_READONLY, token_store

      credentials = authorizer.get_credentials user_id

      if !credentials
        byebug
        url = authorizer.get_authorization_url base_url: uri
        puts "Open the following URL in the browser and enter the " \
          "resulting code after authorization:\n" + url
        code = ENV["CODE"]
        credentials = authorizer.get_and_store_credentials_from_code(
          user_id: user_id, code: code, base_url: uri
        )
      end
      credentials
  end
  # Initialize the API
    def initialize
      @service = Google::Apis::CalendarV3::CalendarService.new
      @service.client_options.application_name = ENV["APPLICATION_NAME"]
      @service.authorization = authorize
      fetch_events(@service)
      redirect_to action: :index
    end
  
    def fetch_events(service)
      calendar_id = ENV["CALENDAR_ID"]
      now = DateTime.now + 1
      @response = @service.list_events(calendar_id,
                                  max_results:   5,
                                  single_events: true,
                                  order_by:      "startTime",
                                  time_min:      DateTime.new(now.year,now.month,now.day,0,0,0),
                                  time_max:      DateTime.new(now.year,now.month,now.day,23,59,59) )
    end
end
