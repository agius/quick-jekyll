module JekyllAssetPipeline
  class LessConverter < JekyllAssetPipeline::Converter
    require 'less'

    def self.filetype
      '.less'
    end

    def convert
      paths = []
      paths << File.join(File.dirname(File.expand_path(__FILE__)), '../_assets/css')
      paths << File.join(File.dirname(File.expand_path(__FILE__)), '../_assets/css/bootstrap')
      puts "less paths: #{paths.inspect}"
      return Less::Parser.new(paths: paths).parse(@content).to_css(:compress => true)
    end
  end
end