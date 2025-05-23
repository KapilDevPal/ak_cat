module MarriageProfiles
  module ProfilesHelper
    def profile_type_badge(profile)
      badge_class = case profile.profile_type
                   when 'marriage'
                     'bg-danger'
                   when 'professional'
                     'bg-success'
                   else
                     'bg-info'
                   end
      
      content_tag(:span, profile.profile_type.titleize, class: "badge #{badge_class}")
    end

    def profile_icon(profile)
      icon_class = case profile.profile_type
                  when 'marriage'
                    'fa-heart text-danger'
                  when 'professional'
                    'fa-briefcase text-success'
                  else
                    'fa-user-circle text-info'
                  end
      
      content_tag(:i, nil, class: "fas #{icon_class} fa-2x")
    end

    def profile_age(profile)
      return nil unless profile.date_of_birth
      ((Date.today - profile.date_of_birth) / 365.25).floor
    end

    def format_profile_attribute(attribute, value, icon_class = nil)
      return unless value.present?
      
      icon = icon_class ? content_tag(:i, nil, class: "fas #{icon_class} me-1 text-muted") : ""
      content_tag(:p) do
        content_tag(:strong) do
          icon + attribute + ": "
        end + value.to_s
      end
    end

    def auto_link(text, html: {})
      return "" unless text.present?
      
      # Simple URL regex pattern
      url_pattern = %r{(https?://\S+)}
      
      # Replace URLs with links
      text.gsub(url_pattern) do |url|
        options = html.merge(href: url)
        attributes = options.map { |k, v| "#{k}=\"#{v}\"" }.join(' ')
        "<a #{attributes}>#{url}</a>"
      end.html_safe
    end
    
    def trackable_share_url(profile)
      # Create a trackable link through ShareLinkTracker
      original_url = profile_url(profile)
      
      # Check if we already have a link for this URL to avoid duplicates
      existing_link = ShareLinkTracker::Link.find_by(original_url: original_url)
      
      if existing_link
        # Return the existing tracked URL - use direct URL construction
        "/share_link_tracker/#{existing_link.short_url}"
      else
        # Create a new tracked URL
        link = ShareLinkTracker::Link.create!(original_url: original_url)
        "/share_link_tracker/#{link.short_url}"
      end
    end
  end
end 