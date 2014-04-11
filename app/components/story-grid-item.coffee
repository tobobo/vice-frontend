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
      @set 'innerClick', false
      $('body').on "click.#{@get('elementId')}", (e) =>
        unless @get('innerClick')
          @set 'innerClick', false
          @set 'isExpanded', false
    else
      $('body').off "click.#{@get('elementId')}"
  ).observes 'isExpanded'
  didInsertElement: ->
    @$('a').on "click.#{@get('elementId')}", (e) ->
      e.stopPropagation()

  willDestroyElement: ->
    $('body').off "click.#{@get('elementId')}"
    @$('a').off "click.#{@get('elementId')}"

  click: (e) ->
    @set 'innerClick', true
    unless @get('isExpanded')
      @toggleProperty 'isExpanded'
    Ember.run.next =>
      @set 'innerClick', false

  close: ->
    @set 'isExpanded', false


`export default StoryGridItemComponent`
