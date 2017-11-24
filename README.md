# How to use conditions in GNU Make?

Никакой "условной компиляции" в GNU Make не существует, ибо:

>Conditionals control what 'make' actually "sees" in the 
makefile, so they cannot be used to control recipes at the
time of execution. (с) documentation

(и всегда лучше вспомнить об этом раньше, чем потратишь 
полдня на перечитывание мануала и тесты).

Зато внутрь Makefil'a можно передавать переменные и делать 
компиляцию в зависимости от их значений. Вот в эту сторону
данный репозиторий и развивается.

### Синтаксис:

#### Запуск: 
make verb=1

#### В самом Makefil'е пишем:

```
ifeq ($(verb), 1)
        @shell action 1
else
        @shell action 2
endif
```

Может быть полезно, например, для вывода (или НЕ вывода) подробных сообщений о ходе компиляции.

