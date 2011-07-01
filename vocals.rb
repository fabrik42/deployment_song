module Deploy
  module Plugins
    module Vocals

      def register(voice, lyrics)
        (@songs ||= []).push :voice => voice, :lyrics => lyrics
      end

      def sing!
        register "good", %Q(
          deployment is awesome
          bug fixing is not
          so please let it work now
          or i cry a lot
        )

        register "cellos", %Q(
          this is the deployment song
          this never must go wrong
          pray all bugs are fixed
          so we can be at home at five
        )

        PLATFORM =~ /darwin/ && fork do
          song = @songs.choice
          `say -v '#{song[:voice]}' '#{song[:lyrics]}'`
        end
      end

    end
  end
end

Capistrano.plugin :vocals, Deploy::Plugins::Vocals
