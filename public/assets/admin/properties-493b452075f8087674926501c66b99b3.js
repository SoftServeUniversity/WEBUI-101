(function() {
  var get_tags;

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
    return $('.special').select2({
      tags: data,
      maximumInputLength: 10,
      tokenSeparators: [","]
    });
  };

}).call(this);
