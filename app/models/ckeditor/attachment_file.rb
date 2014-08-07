class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :path => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :styles => { :content => '800>', :thumb => '118x100#' },
                    :storage => :s3,
                    :s3_credentials =>
                      { :access_key_id  => ENV['S3_KEY'],
                      :secret_access_key => ENV['S3_SECRET'] },
                    :bucket => 'sagehencapitalmanagement'

  # validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 100.megabytes
  do_not_validate_attachment_file_type :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
