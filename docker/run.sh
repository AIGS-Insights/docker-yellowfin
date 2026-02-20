# Load environment variables from .env (default) or custom file
ADDITIONAL_ENV_FILE=""
while [[ $# -gt 0 ]]; do
  case "$1" in
    --env-file|-e)
      ADDITIONAL_ENV_FILE="$2"; shift 2 ;;
    *)
      shift ;;
  esac
done

source "$(dirname "$0")/_init.sh" "$ADDITIONAL_ENV_FILE"

echo "Running Docker container ${CONTAINER_NAME} from image ${CONTAINER_IMAGE}:${CONTAINER_TAG}..."
echo "docker run  --detach  --name "${CONTAINER_NAME}" --publish "${HOST_PORT}:${CONTAINER_PORT}"  --restart unless-stopped --env-file "$ENV_FILE" "${CONTAINER_IMAGE}:${CONTAINER_TAG}""
