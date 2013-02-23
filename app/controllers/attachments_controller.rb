class AttachmentsController < ApplicationController  
    def show
        @attachment = Attachment.find(params[:id])
        send_data @attachment.data, :filename => @attachment.name, :type => @attachment.mime_type, :disposition => "inline"
    end

    def create      
        return if params[:attachment].blank?

        @attachment = Attachment.new
        @attachment.uploaded_file = params[:attachment]

        if @attachment.save
            flash[:notice] = "Thank you for your submission..."
            redirect_to article_path(@attachment.article.id)
        else
            flash[:error] = "There was a problem submitting your attachment."
            render :action => "new"
        end
    end
end