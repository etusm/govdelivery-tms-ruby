module TMS #:nodoc:
  module Base
    def self.included(base)
      base.send(:include, TMS::Util::HalLinkParser)
      base.extend(ClassMethods)
      base.send(:include, InstanceMethods)
      base.send(:include, TMS::CoreExt)
      base.send(:extend, TMS::CoreExt)
    end

    attr_accessor :client, :href, :errors, :new_record

    module ClassMethods
      def to_param
        tmsify(self)
      end
    end

    module InstanceMethods
      def initialize(client, href)
        self.client = client
        self.href = href
      end

      def new_record?
        !!self.new_record
      end

      def href=(href)
        self.new_record=false
        @href=href
      end
    end

  end

end