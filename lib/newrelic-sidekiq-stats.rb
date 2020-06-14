require 'new_relic/agent/sampler'

module NewRelic
  module Agent
    module Samplers
      class SidekiqSampler < NewRelic::Agent::Sampler
        METRIC_MAP = {
          processed:      'ProcessedSize',
          failed:         'FailedSize',
          scheduled_size: 'ScheduledSize',
          retry_size:     'RetrySize',
          dead_size:      'DeadSize',
          enqueued:       'EnqueuedSize',
          processes_size: 'ProcessesSize',
          workers_size:   'WorkersSize',
        }.freeze

        named :sidekiq

        def poll
          return unless Sidekiq.server?

          stats       = Sidekiq::Stats.new
          max_latency = Sidekiq::Queue.all.map(&:latency).max
          ::NewRelic::Agent.logger.debug("Recording metric: Custom/Sidekiq/QueueLatency=#{max_latency}")
          ::NewRelic::Agent.record_metric("Custom/Sidekiq/QueueLatency", max_latency)
          METRIC_MAP.map do |key, name|
            value = stats.public_send(key)
            ::NewRelic::Agent.logger.debug("Recording metric: Custom/Sidekiq/#{name}=#{value}")
            ::NewRelic::Agent.record_metric("Custom/Sidekiq/#{name}", value)
          end
        end
      end
    end
  end
end
