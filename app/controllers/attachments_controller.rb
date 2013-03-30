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
    
    def destroy
	@attachment = Attachment.find(params[:id])
	@attachment.destroy

	respond_to do |format|
	  format.html { redirect_to :back }
	end
    end
    
    def minify_img
        @attachment = Attachment.find(params[:id])
        send_data thumb(@attachment.data, 150), :filename => @attachment.name, :type => @attachment.mime_type, :disposition => "inline"
    end
    
    private
    def thumb(image, size)
      img = Magick::Image.from_blob(image).first
      img.resize_to_fill!(size).to_blob
    end
end