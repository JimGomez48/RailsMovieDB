module MoviesHelper
  def mpaa_rating_icon(rating, height)
    case rating
      when 'G'
        return image_tag('mpaa-icon_g.svg.png', height: height)
      when 'PG'
        return image_tag('mpaa-icon_pg.svg.png', height: height)
      when 'PG-13'
        return image_tag('mpaa-icon_pg-13.svg.png', height: height)
      when 'R'
        return image_tag('mpaa-icon_r.svg.png', height: height)
      when 'NC-17'
        return image_tag('mpaa-icon_nc-17.svg.png', height: height)
      when 'surrendere'
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
          s += genre.name.to_s
          started = true
        else
          s += ", #{genre.name.to_s}"
        end
      end
      s.html_safe
    end
  end
end
