#Role Cluster and Node Group
resource "aws_iam_role" "eks-cluster-ServiceRole-private" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = [
              "eks-fargate-pods.amazonaws.com",
              "eks.amazonaws.com",
            ]
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "eks-cluster-ServiceRole-private"
  path                  = "/"
  tags = {
    "Name" = "eks-cluster/ServiceRole"
  }
}

#IAM Role for NodeGroup-NodeInstanceRole
resource "aws_iam_role" "eks-nodegroup-ng-ma-NodeInstanceRole-private" {
  assume_role_policy = jsonencode(
    {
      Statement = [
        {
          Action = "sts:AssumeRole"
          Effect = "Allow"
          Principal = {
            Service = "ec2.amazonaws.com"
          }
        },
      ]
      Version = "2012-10-17"
    }
  )
  force_detach_policies = false
  max_session_duration  = 3600
  name                  = "eks-nodegroup-ng-ma-NodeInstanceRole-private"
  path                  = "/"
  tags = {
    "Name" = "eks-nodegroup-ng-maneksami2/NodeInstanceRole"
  }
}


# CLOUD WATCH POLICY
resource "aws_iam_role_policy" "eks-cluster-ServiceRole-private__eks-cluster-PolicyCloudWatchMetrics" {
  name = "eks-cluster-PolicyCloudWatchMetrics"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "cloudwatch:PutMetricData",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-cluster-ServiceRole-private.id
}

# ELB PERMISSION POLICY
resource "aws_iam_role_policy" "eks-cluster-ServiceRole-private__eks-cluster-PolicyELBPermissions" {
  name = "eks-cluster-PolicyELBPermissions"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "ec2:DescribeAccountAttributes",
            "ec2:DescribeAddresses",
            "ec2:DescribeInternetGateways",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-cluster-ServiceRole-private.id
}

# NODE GROUP-NODE INSTANCE ROLE - ALB RevokeSecurityGroupIngress
resource "aws_iam_role_policy" "eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyALBIngress" {
  name = "eks-nodegroup-ng-maneksami2-PolicyALBIngress"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "acm:DescribeCertificate",
            "acm:ListCertificates",
            "acm:GetCertificate",
            "ec2:AuthorizeSecurityGroupIngress",
            "ec2:CreateSecurityGroup",
            "ec2:CreateTags",
            "ec2:DeleteTags",
            "ec2:DeleteSecurityGroup",
            "ec2:DescribeAccountAttributes",
            "ec2:DescribeAddresses",
            "ec2:DescribeInstances",
            "ec2:DescribeInstanceStatus",
            "ec2:DescribeInternetGateways",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DescribeSecurityGroups",
            "ec2:DescribeSubnets",
            "ec2:DescribeTags",
            "ec2:DescribeVpcs",
            "ec2:ModifyInstanceAttribute",
            "ec2:ModifyNetworkInterfaceAttribute",
            "ec2:RevokeSecurityGroupIngress",
            "elasticloadbalancing:AddListenerCertificates",
            "elasticloadbalancing:AddTags",
            "elasticloadbalancing:CreateListener",
            "elasticloadbalancing:CreateLoadBalancer",
            "elasticloadbalancing:CreateRule",
            "elasticloadbalancing:CreateTargetGroup",
            "elasticloadbalancing:DeleteListener",
            "elasticloadbalancing:DeleteLoadBalancer",
            "elasticloadbalancing:DeleteRule",
            "elasticloadbalancing:DeleteTargetGroup",
            "elasticloadbalancing:DeregisterTargets",
            "elasticloadbalancing:DescribeListenerCertificates",
            "elasticloadbalancing:DescribeListeners",
            "elasticloadbalancing:DescribeLoadBalancers",
            "elasticloadbalancing:DescribeLoadBalancerAttributes",
            "elasticloadbalancing:DescribeRules",
            "elasticloadbalancing:DescribeSSLPolicies",
            "elasticloadbalancing:DescribeTags",
            "elasticloadbalancing:DescribeTargetGroups",
            "elasticloadbalancing:DescribeTargetGroupAttributes",
            "elasticloadbalancing:DescribeTargetHealth",
            "elasticloadbalancing:ModifyListener",
            "elasticloadbalancing:ModifyLoadBalancerAttributes",
            "elasticloadbalancing:ModifyRule",
            "elasticloadbalancing:ModifyTargetGroup",
            "elasticloadbalancing:ModifyTargetGroupAttributes",
            "elasticloadbalancing:RegisterTargets",
            "elasticloadbalancing:RemoveListenerCertificates",
            "elasticloadbalancing:RemoveTags",
            "elasticloadbalancing:SetIpAddressType",
            "elasticloadbalancing:SetSecurityGroups",
            "elasticloadbalancing:SetSubnets",
            "elasticloadbalancing:SetWebACL",
            "iam:CreateServiceLinkedRole",
            "iam:GetServerCertificate",
            "iam:ListServerCertificates",
            "waf-regional:GetWebACLForResource",
            "waf-regional:GetWebACL",
            "waf-regional:AssociateWebACL",
            "waf-regional:DisassociateWebACL",
            "tag:GetResources",
            "tag:TagResources",
            "waf:GetWebACL",
            "wafv2:GetWebACL",
            "wafv2:GetWebACLForResource",
            "wafv2:AssociateWebACL",
            "wafv2:DisassociateWebACL",
            "shield:DescribeProtection",
            "shield:GetSubscriptionState",
            "shield:DeleteProtection",
            "shield:CreateProtection",
            "shield:DescribeSubscription",
            "shield:ListProtections",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}


# NODE INSTANCE ROLE - POLICY FOR autoscaling
resource "aws_iam_role_policy" "eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyAutoScaling" {
  name = "eks-nodegroup-ng-maneksami2-PolicyAutoScaling"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "autoscaling:DescribeAutoScalingGroups",
            "autoscaling:DescribeAutoScalingInstances",
            "autoscaling:DescribeLaunchConfigurations",
            "autoscaling:DescribeTags",
            "autoscaling:SetDesiredCapacity",
            "autoscaling:TerminateInstanceInAutoScalingGroup",
            "ec2:DescribeLaunchTemplateVersions",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}

# NODE INSTANCE ROLE - POLICY FOR CERT MANAGER ChangeResourceRecordSets
resource "aws_iam_role_policy" "eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyCertManagerChangeSet" {
  name = "eks-nodegroup-ng-maneksami2-PolicyCertManagerChangeSet"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "route53:ChangeResourceRecordSets",
          ]
          Effect   = "Allow"
          Resource = "arn:aws:route53:::hostedzone/*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}

# NODE INSTANCE ROLE - POLICY FOR CERT GET ChangeResourceRecordSets
resource "aws_iam_role_policy" "eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyCertManagerGetChange" {
  name = "eks-nodegroup-ng-maneksami2-PolicyCertManagerGetChange"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "route53:GetChange",
          ]
          Effect   = "Allow"
          Resource = "arn:aws:route53:::change/*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}

# NODE INSTANCE ROLE - POLICY FOR CERT MANAGER HOSTED ListHostedZone
resource "aws_iam_role_policy" "eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyCertManagerHostedZones" {
  name = "eks-nodegroup-ng-maneksami2-PolicyCertManagerHostedZones"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "route53:ListResourceRecordSets",
            "route53:ListHostedZonesByName",
            "route53:ListHostedZones",
            "route53:ListTagsForResource",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}

# NODE INSTANCE ROLE - POLICY FOR PolicyEBS
resource "aws_iam_role_policy" "eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyEBS" {
  name = "eks-nodegroup-ng-maneksami2-PolicyEBS"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "ec2:AttachVolume",
            "ec2:CreateSnapshot",
            "ec2:CreateTags",
            "ec2:CreateVolume",
            "ec2:DeleteSnapshot",
            "ec2:DeleteTags",
            "ec2:DeleteVolume",
            "ec2:DescribeAvailabilityZones",
            "ec2:DescribeInstances",
            "ec2:DescribeSnapshots",
            "ec2:DescribeTags",
            "ec2:DescribeVolumes",
            "ec2:DescribeVolumesModifications",
            "ec2:DetachVolume",
            "ec2:ModifyVolume",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}

# NODE INSTANCE ROLE - POLICY FOR EFS
resource "aws_iam_role_policy" "eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyEFS" {
  name = "eks-nodegroup-ng-maneksami2-PolicyEFS"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "elasticfilesystem:*",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}

# NODE INSTANCE ROLE - POLICY FOR EFS WITH ec2

resource "aws_iam_role_policy" "eks-nodegroup-ng-ma-NodeInstanceRole-private__eks-nodegroup-ng-maneksami2-PolicyEFSEC2" {
  name = "eks-nodegroup-ng-maneksami2-PolicyEFSEC2"
  policy = jsonencode(
    {
      Statement = [
        {
          Action = [
            "ec2:DescribeSubnets",
            "ec2:CreateNetworkInterface",
            "ec2:DescribeNetworkInterfaces",
            "ec2:DeleteNetworkInterface",
            "ec2:ModifyNetworkInterfaceAttribute",
            "ec2:DescribeNetworkInterfaceAttribute",
          ]
          Effect   = "Allow"
          Resource = "*"
        },
      ]
      Version = "2012-10-17"
    }
  )
  role = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}


# POLICY ATTACHMENT - EKS CLUSTER POLICY
resource "aws_iam_role_policy_attachment" "eks-cluster-ServiceRole-private__AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks-cluster-ServiceRole-private.id
}

# POLICY ATTACHMENT - EKS VPC RESOURCE CONTROLLER
resource "aws_iam_role_policy_attachment" "eks-cluster-ServiceRole-private__AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks-cluster-ServiceRole-private.id
}

# POLICY ATTACHMENT - EC2 ECR REGISTRY READ ONLY
resource "aws_iam_role_policy_attachment" "eks-nodegroup-ng-ma-NodeInstanceRole-private__AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}

# POLICY ATTACHMENT - EC2 SSM
resource "aws_iam_role_policy_attachment" "eks-nodegroup-ng-ma-NodeInstanceRole-private__AmazonEC2RoleforSSM" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  role       = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}

# POLICY ATTACHMENT - EKS WORKER NODE 
resource "aws_iam_role_policy_attachment" "eks-nodegroup-ng-ma-NodeInstanceRole-private__AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}

# POLICY ATTACHMENT - EKS CNI POLICY 
resource "aws_iam_role_policy_attachment" "eks-nodegroup-ng-ma-NodeInstanceRole-private__AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}

# POLICY ATTACHMENT - SSM MANAGED INSTANCE
resource "aws_iam_role_policy_attachment" "eks-nodegroup-ng-ma-NodeInstanceRole-private__AmazonSSMManagedInstanceCore" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}

# POLICY ATTACHMENT - CLOUD WATCH AGENT
resource "aws_iam_role_policy_attachment" "eks-nodegroup-ng-ma-NodeInstanceRole-private__CloudWatchAgentServerPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  role       = aws_iam_role.eks-nodegroup-ng-ma-NodeInstanceRole-private.id
}


