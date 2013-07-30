class Speed.Models.Site extends Backbone.Model
  initialize: ->
    @on "sync", @redrawGraph

  url: ->
    "/data/#{@get('code')}.json"

  redrawGraph: =>
    Speed.App.graph.updateData(@)
