class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :url =>':s3_domain_url',
                    :path => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                      :styles => { :content => '800>', :thumb => '118x100#' },
                      :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/aws.yml",
                    :bucket => 'sagehencapitalmanagement'


  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_content_type :data, :content_type => /\Aimage/

  def url_content
    url(:content)
  end
end
