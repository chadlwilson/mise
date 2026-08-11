Describe 'ruby' {
    It 'executes ruby@<v>' -TestCases @(
        @{ v = '4.0.6'; like = 'ruby 4.0.6*' }
        @{ v = '3.4.5'; like = 'ruby 3.4.5*' }
    ) {
        mise x ruby@$v -- ruby --version | Should -BeLike $like
    }

    It 'executes ruby@jruby-<v>' -TestCases @(
        @{ v = '10.1.1.0'; java = 'temurin-25'; like = '*jruby 10.1.1.0 * VM 25*' }
        @{ v = '10.0.6.0'; java = 'temurin-25'; like = '*jruby 10.0.6.0 * VM 25*' }
        @{ v = '9.4'; java = 'temurin-21'; like = '*jruby 9.4.15.0 * VM 21*' }
        @{ v = '9.3'; java = 'temurin-17'; like = '*jruby 9.3.15.0 * VM 17*' }
        @{ v = '9.2'; java = 'temurin-11'; like = '*jruby 9.2 * VM 11*' }
        @{ v = '9.1.17.0'; java = 'temurin-8'; like = '*jruby 9.1.17.0 * VM 8*' }
        @{ v = '9.0.5.0'; java = 'temurin-8'; like = '*jruby 9.0.5.0 * VM 8*' }
        @{ v = '1.7.27'; java = 'temurin-8'; like = '*jruby 1.7.27 * VM 8*' }
    ) {
        mise use java@$java
        $LASTEXITCODE | Should -Be 0
        mise x ruby@jruby-$v -- ruby --version | Should -BeLike $like
    }
}
