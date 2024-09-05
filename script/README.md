# 🔑 Usage

```
$ ./kubeplugin
Usage: ./kubeplugin <RESOURCE_TYPE> <NAMESPACE>
```

For example:

```
$ ./kubeplugin nodes kube-system
nodes, kube-system, minikube, 4%, 3%
```

# ⌛️ Installation

In order to install the script as a kubectl plugin just place it anywhere in your `PATH` as `kubectl-stats` script:

```
$ sudo cp ./kubeplugin /usr/local/bin/kubectl-stats
```

In order to execute the plugin using `kubectl`:

```
$ kubectl stats
nodes, kube-system, minikube, 3%, 3%
```