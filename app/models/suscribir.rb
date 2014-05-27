class Suscribir < ActiveRecord::Base
  has_no_table
  column :email, :string
  column :cedula, :string
  column :apellido, :string
  column :nombre, :string
  column :materia, :string
  
  validates_presence_of :cedula
  validates_presence_of :apellido
  validates_presence_of :nombre
  validates_presence_of :email
  validates_presence_of :materia
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i

  def suscribete_Contabilidad
    mailchimp = Gibbon::API.new
    result = mailchimp.lists.subscribe({
              :id => ENV['MAILCHIMP_LIST_ID_C'], :email => {
                    :email => self.email},
                    :double_optin => false,
                    :update_existing => true,
                    :send_welcome => true
             })

    Rails.logger.info("Subscrito  #{self.email} a MailChimp") if result end

  def suscribete_Programacion
    mailchimp = Gibbon::API.new
    result = mailchimp.lists.subscribe({
              :id => ENV['MAILCHIMP_LIST_ID_P'], :email => {
                    :email => self.email},
                    :double_optin => false,
                    :update_existing => true,
                    :send_welcome => true
             })

    Rails.logger.info("Subscrito  #{self.email} a MailChimp") if result end

      def suscribete_Redes
    mailchimp = Gibbon::API.new
    result = mailchimp.lists.subscribe({
              :id => ENV['MAILCHIMP_LIST_ID_R'], :email => {
                    :email => self.email},
                    :double_optin => false,
                    :update_existing => true,
                    :send_welcome => true
             })

    Rails.logger.info("Subscrito  #{self.email} a MailChimp") if result end
end