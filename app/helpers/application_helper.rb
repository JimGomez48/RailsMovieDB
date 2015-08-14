module ApplicationHelper
  def page_title
    title = "Rails Movie Database"
  end

  def lorem
    'Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore
    magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
    Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
    Fugiat voluptate debitis ad quidem in distinctio obcaecati eligendi cum? Voluptatibus non a repellendus laborum,
    quam doloribus eligendi esse minima quis sequi inventore nam deleniti eius. Cupiditate autem fugit? Perspiciatis
    aliquid facere sapiente incidunt, ratione quaerat inventore, assumenda dolor numquam eligendi reiciendis veritatis
    natus saepe iste quidem a? Praesentium sit laudantium delectus quaerat velit magni, amet perferendis nostrum a
    quibusdam laborum eos earum eaque, ea eligendi et asperiores porro adipisci expedita placeat corporis, sit officia
    dignissimos iusto voluptatum beatae suscipit quod error, recusandae magnam laudantium sed blanditiis optio omnis
    quis. In autem tenetur repudiandae iste est odit nesciunt officia cupiditate dolore reprehenderit. Aut nisi
    repellendus explicabo ullam inventore modi tenetur, distinctio magnam amet sint ut enim quibusdam natus non. Nulla
    iusto mollitia facere similique quaerat accusantium nostrum at excepturi, et blanditiis dolor quo voluptates at
    cumque, exercitationem illum libero quod totam nobis molestias eum, veritatis in voluptatibus dolores non quidem
    quis.'
  end

  def pretty_print_date(date)
    month = ''
    case date.month
      when 1  then month = 'January'
      when 2  then month = 'February'
      when 3  then month = 'March'
      when 4  then month = 'April'
      when 5  then month = 'May'
      when 6  then month = 'June'
      when 7  then month = 'July'
      when 8  then month = 'August'
      when 9  then month = 'September'
      when 10 then month = 'October'
      when 11 then month = 'November'
      when 12 then month = 'December'
    end

    "#{month} #{date.day}, #{date.year}"
  end

  def pretty_print_date_abbrev(date)
    month = ''
    case date.month
      when 1  then month = 'Jan.'
      when 2  then month = 'Feb.'
      when 3  then month = 'March'
      when 4  then month = 'April'
      when 5  then month = 'May'
      when 6  then month = 'June'
      when 7  then month = 'July'
      when 8  then month = 'Aug.'
      when 9  then month = 'Sept.'
      when 10 then month = 'Oct.'
      when 11 then month = 'Nov.'
      when 12 then month = 'Dec.'
    end

    "#{month} #{date.day}, #{date.year}"
  end

  def pretty_print_datetime(datetime)
    date = pretty_print_date(datetime)
    time = pretty_print_time(datetime)
    "#{date} #{time}"
  end

  def pretty_print_datetime_abbrev(datetime)
    date = pretty_print_date_abbrev(datetime)
    time = pretty_print_time(datetime)
    "#{date} #{time}"
  end

  def pretty_print_time(datetime)
    am_pm = 'am'
    am_pm = 'pm' if datetime.hour >= 12
    hour = datetime.hour
    hour = 12 if datetime.hour == 0
    hour = datetime.hour - 12 if datetime.hour > 12
    min = datetime.min
    "#{hour}:#{min} #{am_pm}"
  end
end
