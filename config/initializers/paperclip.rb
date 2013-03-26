module Paperclip
  class Attachment
    def self.default_options
      @default_options ||= {
        :styles            => {},
        :processors        => [:thumbnail],
        :convert_options   => {},
        :default_url       => "/rails.png",
        :default_style     => :original,
        :whiny             => Paperclip.options[:whiny] || Paperclip.options[:whiny_thumbnails],
        :storage           => :azure1,
        :path              => ":modelname/:attachment/:id/:style/:filename",        
        :azure_credentials => "#{RAILS_ROOT}/config/azure.yml",
        :azure_container   => "system",
        :azure_host_alias  => "fbshanghai2013test1.blob.core.windows.net",
        :url               => ':azure_domain_url',
      }
    end    
  end
end