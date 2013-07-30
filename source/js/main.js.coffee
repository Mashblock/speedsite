#= require_self
#= require box_plots
#= require_tree ./models
#= require_tree ./templates
#= require_tree ./views

window.Speed =
  Models: {}
  Collections: {}
  Views: {}
  App: new Marionette.Application()

Speed.App.addRegions
  siteInfo: $("#site_info")

Speed.App.addInitializer ->
  @site = new Speed.Models.Site({code: "herald"})
  @site.fetch success: =>
    @siteInfo.show new Speed.Views.SiteInfo({model: @site})

Speed.App.addInitializer ->
  @graph = new BoxPlots(document.getElementById("main_graph"))

$(document).ready ->
  Speed.App.start()


