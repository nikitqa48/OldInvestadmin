window.initializers = _.extend({
    formHotkeys: function(el) {
        if (!window.hotkeysInitialized) {
            window.hotkeysInitialized = true;
            var isCtrl = false;
            $(document).keyup(function(e) {
                if (e.which == 17) isCtrl = false;
            }).keydown(function(e) {
                    if (e.which == 17) isCtrl = true;
                    if (e.which == 83 && isCtrl == true) {
                        $("form.hotkeys", $(el)).submit();
                        e.preventDefault();
                        return false;
                    }
                });
        }
    }
}, window.initializers);