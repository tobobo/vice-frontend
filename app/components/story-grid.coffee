StoryGridComponent = Ember.Component.extend
  cellWidth: 200;
  cellHeight: 200;
  listWidthStyle: (->
    "width: #{(@get('common.regionNames.length')+1)*@get('cellWidth')}px"
  ).property 'common.regionNames.length', 'cellWidth'
  grid: (->
    console.log 'grid change'
    grid = @get('common.typeNames').map (type) => Ember.Object.create
      type: type
      regions: @get('common.regionNames').map (region) =>
        []
    @get('stories').forEach (story) ->
      if story.get('type')? and story.get('region')?
        grid.objectAt(story.get('type')).get('regions').objectAt(story.get('region')).pushObject story
    grid
  ).property 'stories.@each'

`export default StoryGridComponent`
