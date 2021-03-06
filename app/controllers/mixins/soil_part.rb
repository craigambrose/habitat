module Mixins::SoilPart
  def self.included(base)
    base.send(:belongs_to, :soil)
    base.layout 'site_analysis'
    base.before_filter :authorize_site_read, :only => [:index, :show]
    base.before_filter :authorize_site_edit, :except => [:index, :show]
    base.before_filter :increment_heading
    base.before_filter :load_project
  end
  
  protected
    def site
      @site ||= parent.site
    end
  
    def load_project
      @project = site.project
    end
    
    def authorize_site_read
      authorize! :read, site
    end

    def authorize_site_edit
      authorize! :edit, site
    end
  
end