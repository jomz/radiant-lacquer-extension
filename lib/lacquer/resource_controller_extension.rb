module Lacquer::ResourceControllerExtension
  def self.included(clazz)
    clazz.class_eval do
      require 'lacquer'
      
      def clear_model_cache_with_lacquer
        if model_name == 'Page'
          if model.published_at != nil && model.published?
            purge_page_and_ancestors(model)
          end
        else
          purge_all_pages
        end
        clear_model_cache_without_lacquer
      end
      
      alias_method_chain :clear_model_cache, :lacquer
      
      def purge_page_and_ancestors(page)
        if page.path == '/'
          Lacquer::Varnish.new.purge("^/$") # Instead of "/", which does a global purge
        else
          Lacquer::Varnish.new.purge(page.path)
        end
        purge_page_and_ancestors(page.parent) if page.parent
      end
      
      def purge_all_pages
        Lacquer::Varnish.new.purge('.*')
      end
    end
  end
    
end