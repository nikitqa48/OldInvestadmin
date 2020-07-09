window.initializers = _.extend({
    chosen: function(el) {
        $(".simple-chosen:not(.simple-chosen-initialized)", el).each(function(i, input) {
            $(input).chosen({allow_single_deselect: true});
        }).addClass("simple-chosen-initialized");
    }
}, window.initializers);