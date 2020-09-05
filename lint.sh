#!/usr/bin/env bash

: '
Использование:
`./lint.sh <команда> <путь к директории с кодом>`,
например `./lint.sh format .`

<путь к директории> с кодом по умолчанию равен текущей папке, так что можно запускать и так из корневной директории проекта:
`./lint.sh format`

Команды:

install - установить в текущее окружение библиотеки для форматирования и линтинга
check - проверить, что код проходит проверку линтером и форматером
format - отформатировать весь код
check - проверка форматирования
diff - вывод diff для форматтера
'

SCRIPT_NAME=$0
COMMAND=$1
FILEPATH=${2:-.}

function handle_exit() {
  EXIT_CODE=$1
  if [[ $EXIT_CODE -ne 0 ]]; then
    echo $2
  fi
  exit $EXIT_CODE
}

case ${COMMAND} in
check)
  black --config ./black.toml --check ${FILEPATH}
  handle_exit $? "Formatting error! Run \`$SCRIPT_NAME format\` to format the code"
  ;;

diff)
  black --config ./black.toml --diff ${FILEPATH}
  ;;

format)
  black --config ./black.toml ${FILEPATH}
  ;;

install)
  pip install black==19.3b0
  ;;
*)
  echo $"Usage: $SCRIPT_NAME {check|diff|format|install}"
  exit 1
  ;;
esac
