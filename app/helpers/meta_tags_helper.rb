module MetaTagsHelper

  # Retrieves the meta title for the page
  # Uses the content set with `content_for(:meta_title)` if available; otherwise, falls back to a default value
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["meta_title"]
  end

  # Retrieves the meta description for the page
  # Uses the content set with `content_for(:meta_description)` if available; otherwise, falls back to a default value
  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["meta_description"]
  end

  # Retrieves the meta image URL for the page
  # Uses the content set with `content_for(:meta_image)` if available; otherwise, falls back to a default value
  # Automatically determines whether the image is an absolute URL or an asset and constructs the correct URL
  def meta_image
    # Use custom meta image if provided, otherwise fallback to the default
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])

    # If the image URL starts with "http", assume it's a full URL; otherwise, treat it as an asset path
    meta_image.starts_with?("http") ? meta_image : image_url(meta_image)
  end
end
