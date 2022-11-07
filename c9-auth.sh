## need to Terraform this ?
cat << EOF > patch.yaml
data:
  mapUsers: |
    - userarn: arn:aws:iam::<account_id>:role/eks-nodegroup-ng-ma-NodeInstanceRole-private
      username: dummy
      groups:
        - system:masters
EOF
kubectl get configmap -n kube-system aws-auth -o yaml > aws-auth.yaml
cat patch.yaml >> aws-auth.yaml
kubectl apply -f aws-auth.yaml
#eksctl create iamidentitymapping --cluster mycluster1 --arn ${rolearn} --group system:masters --username admin
kubectl describe configmap -n kube-system aws-auth
