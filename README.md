### Лицензия
Можете использовать это как хотите :) что-то вроде Public Domain

### Требования
* make
* festival
* festvox-ru (не обязательно если нужен только английский)
* eyed3 (не обязательно если не нужно mp3 тэги на выходных файлах)

### Использование
* создаём файл в директории ru для русского и en для английского. Использовать нужно имена файлов на английском и без пробелов: echo "привет" > ru/test.txt
* делаем make
* если всё произошло нормально до должен появится файл mp3 внутри директории ru/test
