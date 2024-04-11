AWSUME_CONFIG_DIR="$HOME/.awsume"
AWSUME_CONFIG_FILE="$AWSUME_CONFIG_DIR/config.yaml"

# Ensure the .awsume directory exists
mkdir -p "$AWSUME_CONFIG_DIR"

# Write the configuration to config.yaml
cat << EOF > "$AWSUME_CONFIG_FILE"
colors: true
fuzzy-match: true
role-duration: 0
region: us-east-2
EOF

echo "Awsume configuration has been bootstrapped."