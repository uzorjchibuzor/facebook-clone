# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@chibuzor.io'
  layout 'mailer'
end
