# Prometheus metrics exporter for Helm Tiller

Add the Kubedex helm repo and install the kubedex-exporter on your Kubernetes cluster.

```
helm repo add kubedex https://kubedex.github.io/charts
helm repo update
helm install kubedex/kubedex-exporter
```

Prometheus should start automatically scraping the kubedex-exporter pod.

Metrics look like this..

```
# HELP helm_chart_info Helm chart information
# TYPE helm_chart_info gauge
helm_chart_info{chart="nginx-ingress", release="my-ingress-release",version="0.28.2", appVersion="1.0.0", namespace="infra"} 1.0
helm_chart_info{chart="kubedex-exporter", release="my-kubedex-exporter-release", version="0.0.1", appVersion="0.0.1", namepspace="infra"} 1.0
helm_chart_info{chart="prometheus", release="prometheus", version="7.0.3", appVersion="2.18.2", namespace="monitoring"} 1.0
helm_chart_info{chart="grafana", release="grafana", version="1.14.6", appVersion="7.0.0", namespace="monitoring"} 1.0
```

This dynamically updates as you add and remove charts.

You can then make pretty Grafana dashboards showing installed Helm package versions.

See https://www.robustperception.io/exposing-the-software-version-to-prometheus for more info.

Full tutorial for setup on minikube is here: https://kubedex.com/kubedex-helm-chart-exporter-for-prometheus/
