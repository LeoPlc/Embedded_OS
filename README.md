# OS EMBARQUE

Notes sur l'OS embarqué

## QEMU

Cross-compilation pour arm via qemu

`qemu-arm -L /home/leo/Documents/SA5/2_OS_Emb/qemu/`

Où on spécifie le chemin d'accès vers le dossier d'installation de qemu

## CROSS COMPILATION

Pour transférer un code du PC vers le raspberry:

`scp hello leo@192.168.1.17:/home/leo/Documents`

où 'hello' est le binaire précédemment cross-compilé grâce à la commande suivante (à partir d'une architecture x86)

`arm-linux-gnueabihf-gcc -o hello hello.c`

La compilation à partir d'une architecture ARM se fait avec l'option supplémentaire `-static`
