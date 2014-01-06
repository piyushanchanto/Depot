OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, '228705533975600', '579b42bc768ed8dbcc0706d9b9bb25c1'
end