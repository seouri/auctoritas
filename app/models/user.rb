class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.validates_format_of_email_field_options = c.validates_format_of_email_field_options.merge(:if => :has_no_credentials?)
    c.validates_length_of_email_field_options = c.validates_length_of_email_field_options.merge(:if => :has_no_credentials?)
    c.validates_uniqueness_of_email_field_options = c.validates_uniqueness_of_email_field_options.merge(:if => :has_no_credentials?)
    c.validates_length_of_password_field_options = c.validates_length_of_password_field_options.merge(:if => :has_no_credentials?)
    c.validates_length_of_password_confirmation_field_options = c.validates_length_of_password_confirmation_field_options.merge(:if => :has_no_credentials?)
  end
  
  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self)
  end
  
  def has_no_openid?
    self.openid_identifier.blank?
  end
  
  def has_no_credentials?
    self.crypted_password.blank? && self.openid_identifier.blank?
  end
end
