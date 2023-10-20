# Pin npm packages by running ./bin/importmap

pin "application", preload: true
pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true
pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true
pin_all_from "app/javascript/controllers", under: "controllers"
pin "base-64", to: "https://ga.jspm.io/npm:base-64@0.1.0/base64.js"
pin "eventemitter3", to: "https://ga.jspm.io/npm:eventemitter3@3.1.2/index.js"
pin "is-plain-obj", to: "https://ga.jspm.io/npm:is-plain-obj@1.1.0/index.js"
pin "nanoid", to: "https://ga.jspm.io/npm:nanoid@3.3.6/index.browser.js"
pin "subtag", to: "https://ga.jspm.io/npm:subtag@0.5.0/subtag.js"
