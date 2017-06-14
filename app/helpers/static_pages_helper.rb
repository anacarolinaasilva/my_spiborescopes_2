module StaticPagesHelper

  #Returns thw full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Spi Borescopes | Inspection Camera | Endoscope | Video Borescope"
    if page_title.empty?
      base_title
    else
      page_title + " | " +  base_title
    end
  end

end
