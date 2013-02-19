class AttachmentsController < ApplicationController  
  def show
    @attachment = Attachment.find(params[:id])
    send_data @attachment.data, :type => @attachment.mime_type, :filename => @attachment.name
  end
end