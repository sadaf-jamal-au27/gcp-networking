# Required
export PROJECT_ID="project-a0827649-d89a-4fbc-989"
project-a0827649-d89a-4fbc-989@cloudbuild.gserviceaccount.com
export REGION="us-central1"
export ZONE="us-central1-a"

# Your public IP (get it from: curl -s ifconfig.me)
export MY_IP="$(curl -s ifconfig.me)"
export MY_IP_CIDR="${MY_IP}/32"

# Globally-unique bucket name for Terraform state
export TF_STATE_BUCKET="${PROJECT_ID}-tfstate-$(date +%s)"

# CSR repo name
export CSR_REPO="gcp-networking-lab"

# Optional: pick a location for CSR (google default is fine)
export CSR_LOCATION="global"