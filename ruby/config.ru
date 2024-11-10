# frozen_string_literal: true

require_relative 'app'

use StackProf::Middleware, enabled: true,
                           mode: :cpu,
                           interval: 1000,
                           raw: true,
                           save_every: 5,
                           path: '../measure/ruby/stackprof.dump'
run Isupipe::App
