# encoding: UTF-8

Capistrano::Configuration.instance(:must_exist).load do

  namespace :deploy do

    desc "Sing-a-long a deployment song"
    task :song do
      logger.info "Deployment may take a while, let's sing-a-long" if logger
      vocals.sing!
    end

  end

  before "deploy", "deploy:song"
end
