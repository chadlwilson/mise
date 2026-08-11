Describe 'ruby' {
    It 'executes ruby@jruby-<v>' -TestCases @(
        @{ v = '10.1.1.0' }
        @{ v = '10.0.6.0' }
        @{ v = '9.4.15.0' }
        # 9.3.x dists ship no ruby entrypoint; mise materializes ruby.bat
        @{ v = '9.3.15.0' }
    ) {
        mise x java@temurin-21 ruby@jruby-$v -- ruby --version | Should -BeLike "*jruby $v*"
    }
}
