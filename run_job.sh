#!/bin/sh
for arg in "$@"
do
  case $arg in
    -h|--help)
      python /workspace/scripts/plexEmail.py --help
      shift # Remove -- help from processing
    ;;
    -v|--verbose)
      echo "Help requested but not found!"
      VERBOSE=true
      shift # Remove -- verbose from processing
    ;;
    -m|--manual)
      exec "$@"
      exit 0
    ;;
    *)
      :
    ;;
  esac
done

python /workspace/scripts/plexEmail.py "$@"
# sleep 3
# ps -ef
# ls -al /workspace
if $VERBOSE; then
  tail -f /workspace/scripts/logs/plexEmail.log
fi
# /bin/sh
