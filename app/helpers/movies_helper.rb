module MoviesHelper
  def mpaa_rating_icon(rating_id, height)
    case rating_id
      when 1
        return image_tag('mpaa-icon_g.svg.png', height: height)
      when 2
        return image_tag('mpaa-icon_pg.svg.png', height: height)
      when 3
        return image_tag('mpaa-icon_pg-13.svg.png', height: height)
      when 4
        return image_tag('mpaa-icon_r.svg.png', height: height)
      when 5
        return image_tag('mpaa-icon_nc-17.svg.png', height: height)
      when 6
        return '<em>Rating surrendered</em>'.html_safe
    end
  end

  def list_movie_genres(genres)
    if genres.empty?
      "<em>No genres to display</em>".html_safe
    else
      s = ''
      started = false
      genres.each do |genre|
        if !started
          s += genre.value.to_s
          started = true
        else
          s += ", #{genre.value.to_s}"
        end
      end
      s.html_safe
    end
  end

  def list_companies(companies)
    if companies.empty?
      "<em>No companies to display</em>".html_safe
    else
      s = ''
      started = false
      companies.each do |company|
        if !started
          s += company.name.to_s
          started = true
        else
          s += ", #{company.name.to_s}"
        end
      end
      s.html_safe
    end
  end

  def list_roles(roles)
    if roles.empty?
      "<em>No roles display</em>".html_safe
    else
      s = ''
      started = false
      roles.each do |role|
        if !started
          s += role.role.to_s
          started = true
        else
          s += " / #{role.role.to_s}"
        end
      end
      s.html_safe
    end
  end
end
