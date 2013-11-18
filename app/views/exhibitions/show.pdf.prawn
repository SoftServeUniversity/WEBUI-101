pdf.text @exhibition.name, size: 20, style: :bold, align: :center
pdf.text "<b>address:</b> #{@exhibition.adress}", size: 12, style: :italic, align: :center, inline_format: true
count = 1

@exhibition.exhibits.map do |exhibit|

pdf.move_down 20
pdf.bounding_box([0, pdf.cursor], width: 500, height: 200) do
  pdf.bounding_box([10, pdf.cursor - 10], width: 480, height: 180) do
    pdf.font 'Times-Roman', style: :normal
    pdf.pad_top(10) do
      pdf.text "<b>Name:</b> #{exhibit.name.truncate(80)}", align: :justify, inline_format: true
    end
    pdf.pad_top(10) do
      pdf.text "<b>Description:</b> #{exhibit.description.truncate(1000)}", align: :justify, inline_format: true
    end
    pdf.transparent(0) {}
  end
  pdf.transparent(0.2) { pdf.stroke_bounds }
end






  pdf.start_new_page if count % 3 == 0
  count += 1
end


string = 'page <page> of <total>'
options = {
  :at => [pdf.bounds.right - 100, 0],
  :align => :right,
  :start_count_at => 1,
  :style => :bold
}
pdf.number_pages string, options

