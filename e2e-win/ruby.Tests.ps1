Describe 'ruby' {
    It 'executes ruby@jruby-9.4.15.0' {
        mise x java@temurin-21 ruby@jruby-9.4.15.0 -- ruby --version | Should -BeLike '*jruby 9.4.15.0*'
    }
}
