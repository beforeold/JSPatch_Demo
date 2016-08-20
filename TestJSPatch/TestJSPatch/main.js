defineClass("ViewController", {
                badMethod: function() {
                    console.log("fixed badMethod 1 * 16 release");
                    require('UIView')
                    require('UIColor')
                    self.view().setBackgroundColor(UIColor.redColor());
            }
        })