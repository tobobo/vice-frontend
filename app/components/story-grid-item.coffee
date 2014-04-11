StoryGridItemComponent = Ember.Component.extend
  tagName: 'li'
  classNames: ['story-grid-item']
  attributeBindings: ['title']
  title: Ember.computed.alias 'story.name'
  isExpanded: false
  classNameBindings: ['statusClass']
  statusClass: (->
    ['pending', 'greenlit', 'rejected'][@get('story.status')]
  ).property 'story.status'
  isExpandedDidChange: (->
    if @get('isExpanded')
      $('body').on 'click.storyGridItem', (e) =>
        unless @get('innerClick')
          @set 'isExpanded', false
    else
      $('body').off 'click.storyGridItem'
  ).observes 'isExpanded'
  didInsertElement: ->
    @$('a').on 'click.storyGridItem', (e) ->
      e.stopPropagation()

  willDestroyElement: ->
    $('body').off 'click.storyGridItem'
    @$('a').off 'click.storyGridItem'

  click: (e) ->
    @set 'innerClick', true
    unless @get('isExpanded')
      @toggleProperty 'isExpanded'
    Ember.run.next =>
      @set 'innerClick', false

  close: ->
    @set 'isExpanded', false


`export default StoryGridItemComponent`
