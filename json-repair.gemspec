# frozen_string_literal: true

require_relative 'lib/json/repair/version'

Gem::Specification.new do |spec|
  spec.name = 'json-repair'
  spec.version = JSON::Repair::VERSION
  spec.authors = ['Aleksandr Zykov']
  spec.email = ['alexandrz@gmail.com']

  spec.summary = 'Repair invalid or malformed JSON documents, including LLM output.'
  spec.description = 'Repairs broken JSON: missing quotes and commas, unclosed brackets, ' \
                     'trailing commas, unquoted keys, single quotes, comments, Python constants, ' \
                     'NDJSON, Markdown code fences and list markers in LLM output, truncated ' \
                     'documents, and more. A Ruby port of the jsonrepair JavaScript library — ' \
                     'useful whenever JSON from LLMs, APIs, or logs does not strictly follow ' \
                     'the standard.'
  spec.homepage = 'https://github.com/sashazykov/json-repair-rb'
  spec.license = 'ISC'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  spec.metadata['changelog_uri'] = "#{spec.homepage}/blob/main/CHANGELOG.md"
  spec.metadata['documentation_uri'] = 'https://rubydoc.info/gems/json-repair'
  spec.metadata['bug_tracker_uri'] = "#{spec.homepage}/issues"

  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ benchmark/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
