class Attachment < ActiveRecord::Base
  belongs_to :article
  attr_accessible :data, :mime_type, :name
  
  def uploaded_file=(incoming_file)
	self.article_id = incoming_file[:article_id]
        self.name = incoming_file[:file].original_filename
        self.mime_type = incoming_file[:file].content_type
        self.data = incoming_file[:file].read
    end

    def filename=(new_filename)
        write_attribute("filename", sanitize_filename(new_filename))
    end

    private
    def sanitize_filename(filename)
        #get only the filename, not the whole path (from IE)
        just_filename = File.basename(filename)
        #replace all non-alphanumeric, underscore or periods with underscores
        just_filename.gsub(/[^\w\.\-]/, '_')
    end
end
