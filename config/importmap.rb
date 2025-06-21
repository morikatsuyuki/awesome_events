# Pin npm packages by running ./bin/importmap

pin "application"

pin "bootstrap", to: "https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
pin "jquery",    to: "https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"
pin "popper",    to: "https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"

# pin "rails-ujs", to: "https://cdn.jsdelivr.net/npm/rails-ujs@5.2.4/lib/assets/compiled/rails-ujs.js"
# pin "@rails/ujs", to: "https://ga.jspm.io/npm:@rails/ujs@7.1.3/lib/rails-ujs.js"