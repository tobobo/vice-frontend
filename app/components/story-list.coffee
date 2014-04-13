StoryListComponent = Ember.Component.extend
  classNames: ['story-list']
  list: (->
    list = @get('common.regionNames').map (region) => Ember.Object.create
      region: region
      empty: true
      types: @get('common.typeNames').map (type) =>
        []
    @get('stories').forEach (story) ->
      if story.get('type')? and story.get('region')?
        region = list.objectAt(story.get('region'))
        region.set 'empty', false
        region.get('types').objectAt(story.get('type')).pushObject story
    console.log 'list is', list
    list
  ).property 'stories.@each'

`export default StoryListComponent`
