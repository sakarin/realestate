module ApplicationHelper
  def display_base_errors resource
    return '' if (resource.errors.empty?) or (resource.errors[:base].empty?)
    messages = resource.errors[:base].map { |msg| content_tag(:p, msg) }.join
    html = <<-HTML
    <div class="alert alert-error alert-block">
      <button type="button" class="close" data-dismiss="alert">&#215;</button>
      #{messages}
    </div>
    HTML
    html.html_safe
  end

  def listing_title(listing)
    "#{t("listing.type.#{listing.listing_type}")} - #{t(listing.property_type)}  #{listing.listing_title_th}"
  end

  def listing_address(listing)
    "#{listing.street_number} #{listing.street_name} #{listing.district.name unless listing.district.blank?} #{listing.amphur.name} #{listing.province.name} #{listing.post_code} "
  end

  def listing_area(listing)

  end
end
