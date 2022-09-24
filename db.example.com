$TTL    604800
@       IN      SOA     infra.example.com. contact.example.com (
                  1     ; Serial
             604800     ; Refresh
              86400     ; Retry
            2419200     ; Expire
             604800     ; Minimum
)
        IN      NS      infra

infra.example.com.          IN      A       172.27.50.20

; Temp Bootstrap Node
bootstrap.lab.example.com.        IN      A      172.27.50.100

; Control Plane Nodes
master0.lab.example.com.         IN      A      172.27.50.101
master1.lab.example.com.         IN      A      172.27.50.102
master2.lab.example.com.         IN      A      172.27.50.103

; Worker Nodes
worker0.lab.example.com.        IN      A      172.27.50.104
worker1.lab.example.com.        IN      A      172.27.50.105

; OpenShift Internal - Load balancer
api.lab.example.com.        IN    A    172.27.50.20
api-int.lab.example.com.    IN    A    172.27.50.20
*.apps.lab.example.com.     IN    A    172.27.50.20

; ETCD Cluster
etcd-0.lab.example.com.    IN    A     172.27.50.101
etcd-1.lab.example.com.    IN    A     172.27.50.102
etcd-2.lab.example.com.    IN    A     172.27.50.103

; OpenShift Internal SRV records (cluster name = lab)
_etcd-server-ssl._tcp.lab.example.com.    86400     IN    SRV     0    10    2380    etcd-0.lab
_etcd-server-ssl._tcp.lab.example.com.    86400     IN    SRV     0    10    2380    etcd-1.lab
_etcd-server-ssl._tcp.lab.example.com.    86400     IN    SRV     0    10    2380    etcd-2.lab

oauth-openshift.apps.lab.example.com.     IN     A     172.27.50.20
console-openshift-console.apps.lab.example.com.     IN     A     172.27.50.20
