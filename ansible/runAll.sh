for playbook in ./*.yml; do
    if [ -f "$playbook" ]; then
        ansible-playbook "$playbook"
    fi
done