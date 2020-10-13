# Helm Charts for Optima

We use Helm charts to deploy and manage our backend services on Kubernetes clusters.

## General Helm Chart directory structure is as follows:

```
optima-chart
 ┣ templates
 ┃ ┣ tests
 ┃ ┃ ┗ test-connection.yaml
 ┃ ┣ deployment.yaml
 ┃ ┣ ingress.yaml
 ┃ ┣ NOTES.txt
 ┃ ┣ service.yaml
 ┃ ┗ _helpers.tpl
 ┣ .helmignore
 ┣ Chart.yaml
 ┗ values.yaml
```

- **Chart.yaml** contains definitions required for the charts.
- **values.yaml** contains variables required by the K8s manifests.
- **templates** directory contains the K8s manifests i.e. deployment, service, ingress yamls, etc. and the template(.tpl) files
- **\_helpers.tpl** contains the template definitions for charts.

The repository contains the helm chart to deploy both **node** and **spingboot** micro-services.

## Commands for Helm Charts

Installing the chart

```
helm install optima ./optima-charts
```

Listing installed charts

```
helm ls
```

Uninstalling the chart

```
helm uninstall optima
```

> In the above, commands, **optima** is the release name of the deployed chart

## Debugging the deployed resources using **kubectl**

In order to debug the deployed resources, we use these commands: **get**, **describe** and **logs**

1. Listing all resources in the current namespace

   ```
   kubectl get all
   ```

2. Listing all resources of a kind

   ```
   kubectl get <resource-kind>
   ```

   where **resource-kind** can be deployment, pod, service, ingress, etc.

3. Retrieving detailed information about a resource

   ```
   kubectl describe <resource-kind> <resource-name>
   ```

   where **resource-kind** can be deployment, pod, service, ingress, etc. and **resouce-name** is the name of the said resource

4. Retrieving logs for a pod

   ```
   kubectl logs <pod-name>
   ```

   where **pod-name** is the name of the pod

## References

For more **Helm** commands, refer to [Helm Commands](https://helm.sh/docs/helm/)

For more **kubectl** commands, refer to [kubectl Cheat Sheet](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)
