# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "https://ga.jspm.io/npm:@hotwired/stimulus@3.2.2/dist/stimulus.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "popper", to: 'popper.js', preload: true
pin "bootstrap", to: 'bootstrap.min.js', preload: true
pin "@kurkle/color", to: "https://ga.jspm.io/npm:@kurkle/color@0.3.2/dist/color.esm.js"
pin "feather-icons", to: "https://ga.jspm.io/npm:feather-icons@4.28.0/dist/feather.js"
pin "chartkick", to: "chartkick.js"
pin "Chart.bundle", to: "Chart.bundle.js"
pin "@rails/actioncable", to: "actioncable.esm.js"
pin_all_from "app/javascript/channels", under: "channels"
pin "stimulus-timeago", to: "https://ga.jspm.io/npm:stimulus-timeago@4.1.0/dist/stimulus-timeago.mjs"
pin "@babel/runtime/helpers/esm/assertThisInitialized", to: "https://ga.jspm.io/npm:@babel/runtime@7.22.6/helpers/esm/assertThisInitialized.js"
pin "@babel/runtime/helpers/esm/classCallCheck", to: "https://ga.jspm.io/npm:@babel/runtime@7.22.6/helpers/esm/classCallCheck.js"
pin "@babel/runtime/helpers/esm/createClass", to: "https://ga.jspm.io/npm:@babel/runtime@7.22.6/helpers/esm/createClass.js"
pin "@babel/runtime/helpers/esm/createForOfIteratorHelper", to: "https://ga.jspm.io/npm:@babel/runtime@7.22.6/helpers/esm/createForOfIteratorHelper.js"
pin "@babel/runtime/helpers/esm/createSuper", to: "https://ga.jspm.io/npm:@babel/runtime@7.22.6/helpers/esm/createSuper.js"
pin "@babel/runtime/helpers/esm/defineProperty", to: "https://ga.jspm.io/npm:@babel/runtime@7.22.6/helpers/esm/defineProperty.js"
pin "@babel/runtime/helpers/esm/inherits", to: "https://ga.jspm.io/npm:@babel/runtime@7.22.6/helpers/esm/inherits.js"
pin "@babel/runtime/helpers/esm/typeof", to: "https://ga.jspm.io/npm:@babel/runtime@7.22.6/helpers/esm/typeof.js"
pin "date-fns", to: "https://ga.jspm.io/npm:date-fns@2.30.0/esm/index.js"
