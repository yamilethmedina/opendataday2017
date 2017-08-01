class TidePrediction

  def self.events
    doc = Nokogiri::HTML(open("http://miamistories.net/susan/8723178_annual.xml"))
    array = []
    doc.xpath("//item").each do |i|
      date = i.css('date').text
      time = i.css('time').text
      date_time = format_date(date, time)
      pred_in_ft = i.css('pred_in_ft').text
      array << { start: date_time, title: "Pred in feet #{pred_in_ft}" }
    end
    array
  end

  private

  def self.format_date(date, time)
    d = date.to_date
    t = Time.parse(time)
    DateTime.new(d.year, d.month, d.day, t.hour, t.min)
  end

end