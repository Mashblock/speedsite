class window.BoxPlots
  full_width: 940
  full_height: 400
  margin:
    top: 20
    right: 20
    bottom: 30
    left: 40

  categories:[
    "navigationStart"
    "fetchStart"
    "domainLookupStart"
    "connectStart"
    "domainLookupEnd"
    "connectEnd"
    "requestStart"
    "responseStart"
    "responseEnd"
    "domLoading"
    "domInteractive"
    "domContentLoadedEventStart"
    "domContentLoadedEventEnd"
    "domComplete"
    "loadEventStart"
    "loadEventEnd"
  ]

  constructor: (@element)->
    @height = @full_height - @margin.top - @margin.bottom
    @width  = @full_width - @margin.left - @margin.right
    @x_scale = d3.scale.linear().range([0, @width]).domain([0, 10000])
    @svg = d3.select(@element).append("svg")
      .attr("width", @full_width)
      .attr("height", @full_height)

    @paper = @svg.append("g")
      .attr("transform", "translate(#{@margin.left}, #{@margin.top})")

  updateData: (@site)->
    y_pos = 10
    for category in @categories
      data = @site.get("browser")[category]
      @paper.selectAll(".dot.#{category}")
        .data(data)
        .enter().append("circle")
        .attr("class", "dot #{category}")
        .attr("r", 3.5)
        .attr("cx", (d)=> @x_scale(d))
        .attr("cy", y_pos)

      y_pos += 20

