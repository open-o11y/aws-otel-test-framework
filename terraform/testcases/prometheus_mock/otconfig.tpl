receivers:
  prometheus:
    config:
      global:
        scrape_interval: 15s
      scrape_configs:
      - job_name: "test-pipeline-job"
        static_configs:
        - targets: [ ${sample_app_listen_address_ip}:${sample_app_lb_port} ]
exporters:
  awsprometheusremotewrite:
    endpoint: "https://${mock_endpoint}"
service:
  pipelines:
    metrics:
     receivers: [prometheus]
     exporters: [awsprometheusremotewrite]