function load_dotenv
    # Проверка наличия аргумента (пути к файлу)
    if test -z $argv[1]
        echo "The path to the .env file is not specified"
        return 1
    end

    # Получение абсолютного пути к файлу
    set -l env_file (realpath $argv[1])

    # Проверка существования файла
    if test ! -f $env_file
        echo "File $env_file not found"
        return 1
    end

    set -l env_content (cat $env_file)

    for line in $env_content
        # Пропускаем пустые строки и комментарии
        if test -z "$line" || test "$line" = "#" || string match -q -r "^#" $line
            continue
        end

        # Разделение строки на ключ и значение
        set -l key (echo $line | cut -d= -f1)
        set -l value (echo $line | cut -d= -f2)

        # Заменяем переменные окружения в значении с обработкой кавычек
        set -l value (eval echo $value)

        # Создание переменной окружения с обработкой пустых значений
        set -gx $key $value
    end
end
