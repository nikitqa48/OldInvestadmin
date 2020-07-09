window.initializers = _.extend({
    datePicker: function(el) {
        $(".date-picker:not(.date-picker-initialized)", el).each(function(i, input) {
            $(input).datepicker({language: 'ru',format: 'yyyy-mm-dd', weekStart: 1});
        }).addClass("date-picker-initialized");
    }
}, window.initializers);