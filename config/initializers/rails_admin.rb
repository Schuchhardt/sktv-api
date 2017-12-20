# require 'i18n'
# I18n.default_locale = :es
RailsAdmin.config do |config|
 
  config.main_app_name = "SKTV"
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  #   t.integer  :sign_in_count, default: 0, null: false
  #   t.datetime :current_sign_in_at
  #   t.datetime :last_sign_in_at
  ActiveRecord::Base.descendants.each do |imodel|
    config.model "#{imodel.name}" do
      exclude_fields :created_at, :updated_at
    end
  end


  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show

  end
end
