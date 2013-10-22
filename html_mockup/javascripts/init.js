 var articleView = Backbone.View.extend({
        events: {
          'mousedown .editable': 'editableClick'
        },
        render: function() {
        	this.$el.html("<div class='row'><h1 class='editable' data-button-class='title'>Help Page</h1><p contenteditable='true' class='editable' data-button-class='all'>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,</div>");
        	return this;
        },

        editableClick: etch.editableInit
      });
 etch.config.buttonClasses = {
        'default': ['save'],
        'all': ['bold', 'italic', 'underline', 'unordered-list', 'ordered-list', 'link', 'clear-formatting', 'save'],
        'title': ['bold', 'italic', 'underline', 'save']
      };

 article_view = new articleView();

 $('.container').html(article_view.render().el);
