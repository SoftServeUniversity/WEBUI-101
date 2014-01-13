(function() {
  $(function() {
    var converter1, editor1, get_biographies, get_tags;
    $.get("/admin/tags.json", function(response) {
      var item;
      return get_tags((function() {
        var _i, _len, _results;
        _results = [];
        for (_i = 0, _len = response.length; _i < _len; _i++) {
          item = response[_i];
          _results.push(item.name);
        }
        return _results;
      })());
    });
    get_tags = function(data) {
      return $('#exhibit_tags_string').select2({
        tags: data,
        maximumInputLength: 10,
        tokenSeparators: [","]
      });
    };
    $.get("/admin/biographies.json", function(response) {
      var item;
      return get_biographies((function() {
        var _i, _len, _results;
        _results = [];
        for (_i = 0, _len = response.length; _i < _len; _i++) {
          item = response[_i];
          _results.push(item.name);
        }
        return _results;
      })());
    });
    get_biographies = function(data) {
      return $('#exhibit_biographies_string').select2({
        tags: data,
        maximumInputLength: 30,
        tokenSeparators: [","]
      });
    };
    converter1 = Markdown.getSanitizingConverter();
    editor1 = new Markdown.Editor(converter1);
    return editor1.run();
  });

}).call(this);
