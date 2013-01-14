module TSMS #:nodoc:
  class VoiceMessage
    include InstanceResource

    writeable_attributes :play_url
    readonly_attributes :created_at, :completed_at
    collection_attributes :recipients

    def self.to_s
      "Message"
    end
  end
end