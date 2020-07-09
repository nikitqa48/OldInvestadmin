window.initializers = _.extend({
    toolTip: function(el) {
        $(".btn-with-tooltip:not(.btn-with-tooltip-initialized)", el).each(function(i, el) {
            $(el).tooltip();
        }).addClass("btn-with-tooltip-initialized");
    }
}, window.initializers);