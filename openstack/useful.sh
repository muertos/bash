# useful commands

# Enable debug in Magnum
sed -i.bk '/^debug/s/False/True/' /etc/kolla/magnum-conductor/magnum.conf
docker restart magnum_conductor magnum_api

for i in 1 2 3; do ssh node$i "sed -i.bk '/^debug/s/False/True/' /etc/kolla/magnum-conductor/magnum.conf; docker restart magnum_conductor magnum_api"; done
